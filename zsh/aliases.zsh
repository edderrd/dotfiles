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

# ALIAS COMMANDS
alias ls="exa --icons --group-directories-first"
alias l="exa --icons --group-directories-first"
alias ll="exa --icons --group-directories-first -l"
alias la="exa --icons --group-directories-first -l -a"
alias g="goto"
alias grep='grep --color'

alias crontab="VIM_CRONTAB=true crontab"

# neovim
alias vim="nvim"
alias vi="nvim"

# git
alias g="git"

##########
# ripgrep
##########
if (( $+commands[rg] )); then
    alias grep="rg --color=auto"
else
    alias grep="grep --colour=auto"
fi

######################
# bat: cat with colors
######################
if (( $+commands[bat] )); then
    alias cat="bat"
fi

# Tool replacements
# alias cat=bat
# alias ping='prettyping --nolegend'
# alias man=tldr

alias art="php artisan"

