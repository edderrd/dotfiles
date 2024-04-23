## enable this if there's no pretty colors
# export TERM="xterm-256color"   # pretty colors

# solve too many files open error
#ulimit -n 4096

[[ -f ~/.zsh/brew.zsh ]] && source ~/.zsh/brew.zsh
[[ -f ~/.zsh/goto.zsh ]] && source ~/.zsh/goto.zsh

# my path
export PATH=/usr/local/bin:/usr/local/sbin/$HOME/.local/bin:$PATH:$HOME/.bin:/usr/local/share/npm/bin:~/.composer/vendor/bin

# loading item2 integrations
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="/usr/local/opt/openssl/bin:$PATH"


## avr-gcc path used by qmk firmware
export PATH="/usr/local/opt/avr-gcc@8/bin:$PATH"

## mysql-client
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

## kitty terminal aliases
if [[ $TERM == "xterm-kitty" ]]; then
  # alias ssh="kitty +kitten ssh"
fi

## kitty terminal aliases
if [[ $TERM == "wezterm" ]]; then
  alias ssh="wezterm ssh"
fi

## raycast confetti
alias confetti="open raycast://confetti"

## using vim keybindings in terminal
# bindkey -v
#zle-keymap-select () {
  #case $KEYMAP in
    #vicmd) print -rn -- $terminfo[cvvis];; # block cursor
    #viins|main) print -rn -- $terminfo[cnorm];; # less visible cursor
  #esac
#}
#VI_MODE=true
#bindkey -v


alias ssh='export TERM="xterm-256color"; ssh'
alias sshp="ssh -o ProxyCommand='nc -x 127.0.0.1:9999 %h %p' -E /dev/null"

## volta
# export VOLTA_HOME="$HOME/.volta"
# export PATH="$VOLTA_HOME/bin:$PATH"
