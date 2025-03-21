file=~/yazi/target/release/yazi
if [ -f "$file" ]; then
  echo "yazi is already installed"
  exit 1
fi

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update
. $HOME/.cargo/env

# yazi
git clone https://github.com/sxyazi/yazi.git ~/yazi
cd ~/yazi
cargo build --release --locked
echo "alias yazi='~/yazi/target/release/yazi'" >> ~/.bashrc
cd -
