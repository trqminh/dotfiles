#!/usr/bin/env bash
# Claude Code statusline. Reads the session JSON on stdin, prints one line.
#
# Fields consumed (Claude Code >= 2.1.x): .model, .effort,
# .context_window.used_percentage, .rate_limits.{five_hour,seven_day}, .cost, .workspace.
# Note: .rate_limits only exists for Claude.ai subscribers, and only after the
# session's first API response -- so the 5h/wk gauges show a dash until then.
#
# Kept to two forks total (jq, git); everything else is a bash builtin, since
# this runs on every statusline refresh.
exec 2>/dev/null

# Fall back to a bare line if jq is missing, so the statusline never errors out.
if ! command -v jq >/dev/null; then
	printf $'\033[36m◆ claude\033[0m'
	exit 0
fi

IFS=$'\t' read -r name effort ctx c5 r5 c7 r7 cents cwd < <(
	jq -r '[
    (.model.display_name // "?"),
    (.effort.level // "-"),
    (.context_window.used_percentage // 0 | round),
    (.rate_limits.five_hour.used_percentage  // -1 | round),
    (.rate_limits.five_hour.resets_at        //  0 | floor),
    (.rate_limits.seven_day.used_percentage  // -1 | round),
    (.rate_limits.seven_day.resets_at        //  0 | floor),
    (.cost.total_cost_usd // 0 | . * 100 | round),
    (.workspace.current_dir // .cwd // "")
  ] | @tsv'
)

# Guard against a malformed payload leaving numerics empty.
[[ $ctx   =~ ^-?[0-9]+$ ]] || ctx=0
[[ $c5    =~ ^-?[0-9]+$ ]] || c5=-1
[[ $c7    =~ ^-?[0-9]+$ ]] || c7=-1
[[ $r5    =~ ^[0-9]+$   ]] || r5=0
[[ $r7    =~ ^[0-9]+$   ]] || r7=0
[[ $cents =~ ^[0-9]+$   ]] || cents=0

DIM=$'\033[2m'
RST=$'\033[0m'
SEP="${DIM} · ${RST}"

printf -v now '%(%s)T' -1

# Append one usage gauge to $out: "5h 34% 3h", or a dim dash when unknown.
# Colour by severity: green <50, yellow 50-79, red >=80.
add_gauge() {
	local label=$1 pct=$2 reset=$3 color left

	if (( pct < 0 )); then
		out+="${SEP}${DIM}${label} —${RST}"
		return
	fi

	if   (( pct >= 80 )); then color=$'\033[31m'
	elif (( pct >= 50 )); then color=$'\033[33m'
	else                       color=$'\033[32m'
	fi
	out+="${SEP}${DIM}${label} ${color}${pct}%${DIM}"

	# Round the countdown up, so "resets in 2h59m" reads 3h rather than 2h.
	left=$(( reset - now ))
	if (( reset > 0 && left > 0 )); then
		if   (( left >= 86400 )); then out+=" $(( (left + 86399) / 86400 ))d"
		elif (( left >= 3600  )); then out+=" $(( (left + 3599)  / 3600  ))h"
		else                           out+=" $(( (left + 59)    / 60    ))m"
		fi
	fi
	out+="${RST}"
}

# --- model -------------------------------------------------------------------
[[ -n $name && $name != "?" ]] || name="claude"
name=${name#Claude }
name=${name/ (1M context)/ 1M}
name=${name/ (1M)/ 1M}
out=$'\033[1;36m◆ '"${name}${RST}"

[[ $effort == "-" ]] && effort=""
[[ -n $effort ]] && out+="${SEP}${DIM}${effort}${RST}"

# --- context / 5h / weekly ----------------------------------------------------
add_gauge ctx "$ctx" 0
add_gauge 5h  "$c5"  "$r5"
add_gauge wk  "$c7"  "$r7"

# --- session cost -------------------------------------------------------------
if (( cents > 0 )); then
	printf -v frac '%02d' $(( cents % 100 ))
	out+="${SEP}${DIM}\$$(( cents / 100 )).${frac}${RST}"
fi

# --- cwd + git ----------------------------------------------------------------
if [[ -n $cwd ]]; then
	# $tilde via a variable: a bare ~ in the replacement would be tilde-expanded
	# straight back to $HOME.
	tilde='~'
	out+="${SEP}"$'\033[34m'"${cwd/#$HOME/$tilde}${RST}"

	# One call yields branch and dirtiness: --branch puts "## main...origin/main"
	# on the first line, and any further line means the tree is dirty.
	# --no-optional-locks so a refresh never contends on index.lock;
	# --ignore-submodules=dirty so churn inside submodules is ignored, while a
	# changed submodule *pointer* still counts (this repo is submodule-heavy).
	gitout=$(git --no-optional-locks -C "$cwd" status --porcelain --branch --ignore-submodules=dirty)
	if [[ -n $gitout ]]; then
		branch=${gitout%%$'\n'*}          # "## main...origin/main"
		rest=${gitout#"$branch"}          # "" when clean
		branch=${branch#\#\# }
		branch=${branch%%...*}
		[[ $branch == *"(no branch)"* ]] && branch="detached"
		[[ -n $rest ]] && branch+="*"
		out+=$' \033[35m⎇ '"${branch}${RST}"
	fi
fi

printf '%s' "$out"
