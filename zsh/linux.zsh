export TERM="xterm-256color"   # pretty colors

# solve too many files open error
#ulimit -n 4096

# my path
export PATH=$PATH:$HOME/.bin

# Loading the SSH key
# sudo apt install keychain
if (( $+commands[cargo] )); then
  /usr/bin/keychain -q --nogui $HOME/.ssh/id_rsa
  source $HOME/.keychain/$HOST-sh
fi

# install neovim binaries directly
[[ -f /opt/nvim-linux64/bin/nvim ]] && export PATH="$PATH:/opt/nvim-linux64/bin"

# spaceship
source "$HOME/.zsh/spaceship/spaceship.zsh"
