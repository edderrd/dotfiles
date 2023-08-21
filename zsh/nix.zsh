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

#######
# exa #
#######
if (( $+commands[exa] )); then
    alias l='exa -lh --icons --group-directories-first'
    alias ls='exa --icons --group-directories-first'
    alias ll='exa -lh --icons --group-directories-first'
    alias la='exa -lah --icons --group-directories-first'
else
  alias l='ls -ls'
  alias ls='ls -h'
  alias ll='ls -lsh'
  alias la='ls -lsha'
fi

# GO LANG PATH
if (( $+commands[go] )); then
    # mkdir -p $HOME/.go/{bin,src,pkg}
    export GOPATH="$HOME/.go"
    export PATH=$PATH:$GOPATH/bin
    export GOPATH="$HOME/.go"
    export GOROOT="$(brew --prefix golang)/libexec"
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
