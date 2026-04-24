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

##########
# ripgrep
##########
if (( $+commands[rg] )); then
    alias grep="rg --color=auto"
else
    alias grep="grep --colour=auto"
fi

## raycast confetti
alias confetti="open raycast://confetti"

FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"

# pnpm
export PNPM_HOME="/Users/edder/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

alias ssh='export TERM="xterm-256color"; ssh'
alias sshp="ssh -o ProxyCommand='nc -x 127.0.0.1:9999 %h %p' -E /dev/null"

# Lando
export PATH="/Users/edder/.lando/bin${PATH+:$PATH}"; #landopath

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/edder/.docker/completions $fpath)
# End of Docker CLI completions

