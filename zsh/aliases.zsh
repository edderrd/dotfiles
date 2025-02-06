# Alias
# ---
#
# alias k="kubectl"
# alias h="helm"
# alias tf="terraform"
# alias a="ansible"
# alias ap="ansible-playbook"
# alias dt="datree"

# mac OS shortcuts
alias code="open -a 'Visual Studio Code'"

alias g="goto"
alias grep='grep --color'

alias crontab="VIM_CRONTAB=true crontab"

# neovim
alias vim="nvim"
alias vi="nvim"

# git
alias g="git"

######################
# bat: cat with colors
######################
if (( $+commands[bat] )); then
    alias cat="bat"
fi


######################
# docker-compose 
######################
if (( $+commands[docker] )); then
    alias docker-compose="docker compose"
fi

# Tool replacements
# alias cat=bat
# alias ping='prettyping --nolegend'
# alias man=tldr

alias art="php artisan"

