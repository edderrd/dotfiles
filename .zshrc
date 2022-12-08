[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -f ~/.zsh/functions.zsh ]] && source ~/.zsh/functions.zsh
[[ -f ~/.zsh/starship.zsh ]] && source ~/.zsh/starship.zsh
[[ -f ~/.zsh/brew.zsh ]] && source ~/.zsh/brew.zsh
[[ -f ~/.zsh/nvm.zsh ]] && source ~/.zsh/nvm.zsh
[[ -f ~/.zsh/goto.zsh ]] && source ~/.zsh/goto.zsh
[[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ -f ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh ]] && source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

# All OS loading
[[ -f ~/.zsh/nix.zsh ]] && source ~/.zsh/nix.zsh
# OS Specific Files
[[ "$machine" = "Mac" ]] && source ~/.zsh/osx.zsh
[[ "$machine" = "Linux" ]] && source ~/.zsh/linux.zsh

# Load Starship
eval "$(starship init zsh)"

# Load Direnv
eval "$(direnv hook zsh)"
