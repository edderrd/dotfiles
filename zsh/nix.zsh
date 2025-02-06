autoload bashcompinit          # bash compliation compability with zsh
bashcompinit

## case insensitive autocomplete
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

export LC_CTYPE="en_US.UTF-8"
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

export VISUAL=nvim
export EDITOR="$VISUAL"

## disable command history if you pre-pend you command with a space
setopt HIST_IGNORE_SPACE

# loading RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && export PATH="$PATH:$HOME/.rvm/bin"

# loading flutter
[[ -s "/usr/local/flutter/bin/flutter" ]] && export PATH="$PATH:/usr/local/flutter/bin"

# Ruby rbenv
if [[ -s "$HOME/.rbenv/bin/rbenv" ]]; then
    export PATH=${HOME}/.rbenv/bin:${PATH}
    eval "$(rbenv init -)"
fi

###############
#### PyEnv ####
###############
if (( $+commands[pyenv] )); then
  export PYENV_ROOT="$HOME/.pyenv"
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# Rust (cargo)
if (( $+commands[cargo] )); then
  export PATH=$PATH:~/.cargo/bin
fi

# Deno
if (( $+commands[deno])); then
  export PATH="$HOME/.deno/bin:$PATH"
fi

test -e "/etc/bash_completion.d/climate_completion" && source /etc/bash_completion.d/climate_completion


################
#### DOCKER ####
################
if (( $+commands[docker] )); then
    alias dc="docker compose"
    # docker compose alias
    drma() { docker rm $(docker ps -q -a); }
    dria() { docker rmi $(docker images -q); }
    #dps() {docker ps --format="table {{.Names}}\t{{.Status}}\t{{.Ports}}\t{{.Image}}"}
    dps() {docker ps --format="table {{.Names}}\t{{.Status}}\t{{.Ports}}"}
    # enter into a running container
    function dent { docker exec -i -t $1 /bin/bash }
    # run bash for any image
    function dbash { docker run --rm -i -t -e TERM=xterm --entrypoint /bin/bash $1 }
fi

alias l='ls -ls'
alias ls='ls -h'
alias ll='ls -lsh'
alias la='ls -lsha'

#######
# eza #
#######
if (( $+commands[eza] )); then
    alias l='eza -lh --icons --group-directories-first'
    alias ls='eza --icons --group-directories-first'
    alias ll='eza -lh --icons --group-directories-first'
    alias la='eza -lah --icons --group-directories-first'
    alias tree='eza -a --tree --icons --level=3'
fi

# GO LANG PATH
if (( $+commands[go] )); then
    # mkdir -p $HOME/.go/{bin,src,pkg}
    export GOPATH="$HOME/.go"
    export PATH=$PATH:$GOPATH/bin
    # export GOROOT="$(brew --prefix golang)/libexec"
fi

[ -s "$HOME/.rover/env" ] && . "$HOME/.rover/env"

# exports and commands that shouldn't be in any git repo
[ -s "$HOME/.secrets" ] && . "$HOME/.secrets"

# autocomplete project
pro() { cd ~/Code/$1; }
compctl -W ~/Code/ -/ pro


# kubernetes cli
if (( $+commands[kubectl] )); then
    alias k="kubectl"
    source <(kubectl completion zsh)
fi

# fuzzy search
if (( $+commands[fzf] )); then
    ## brew install fzf fd
    eval "$(fzf --zsh)"

    # use fd for searching
    export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cmd-prefix --exclude .git"
    export FZF_CTRL_T_OPTS="--preview 'bat -n --colors=always --line-range :500 {}'"
    export FZF_ALT_C_OPTS="--preview 'exa --tree --color=always {} | head -200'"

    _fzf_compgen_path() {
        fd --hidden --exclude .git . "$1"
    }

    _fzf_compgen_dir() {
        fd --type=d --hidden --exclude .git . "$1"
    }

    _fzf_comprun() {
      local command=$1
      shift

      case "$command" in
        cd)           fzf --preview 'exa --tree --color=always {} | head -200' "$@" ;;
        export|unset) fzf --preview "eval 'echo \$' {}" "$@" ;;
        ssh)          fzf --preview 'dig {}' "$@" ;;
        # *)            fzf --preview "--preview 'bat --edder -n --color=always --line-range :500 {}'" "$@" ;;
        *)            fzf --preview 'bat -n --color=always --line-range :500 {}' "$@" ;;
      esac
    }

    # source ~/.zsh/fzf-git.sh/fzf-git.sh

    # Export all the known keymaps with prefix CTRL-g so it can be mapped in tmux
    export FZF_GIT_BINDKEYS=$(bindkey -p '^g')

fi

# bat (replacement of cat)
if (( $+commands[bat] )); then
    # brew install bat
    export BAT_THEME="TwoDark"
fi

if (( $+commands[fuck] )); then
    # brew install thefuck
    eval $(thefuck --alias)
    eval $(thefuck --alias fk)
fi

# fnm
if [[ -s "$HOME/.local/share/fnm" ]]; then
  FNM_PATH="$HOME/.local/share/fnm"
  if [ -d "$FNM_PATH" ]; then
    export PATH="$HOME/.local/share/fnm:$PATH"
    eval "`fnm env`"
  fi
fi

## history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

