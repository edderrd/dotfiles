[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -f ~/.zsh/functions.zsh ]] && source ~/.zsh/functions.zsh
# [[ -f ~/.zsh/starship.zsh ]] && source ~/.zsh/starship.zsh
[[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ -f ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh ]] && source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
[[ -f ~/.zsh/zsh-nx-completion/nx-completion.plugin.zsh ]] && source ~/.zsh/zsh-nx-completion/nx-completion.plugin.zsh >/dev/null 2>&1;

# OS Specific Files
[[ "$machine" = "Mac" ]] && source ~/.zsh/osx.zsh
[[ "$machine" = "Linux" ]] && source ~/.zsh/linux.zsh

# All OS loading
[[ -f ~/.zsh/nix.zsh ]] && source ~/.zsh/nix.zsh

# scripts imports that depends on paths
# [[ -f ~/.zsh/nvm.zsh ]] && source ~/.zsh/nvm.zsh
[[ -f ~/.zsh/fnm.zsh ]] && source ~/.zsh/fnm.zsh

# Load Direnv
eval "$(direnv hook zsh)"

# Run compinit once with a 24h cache to avoid slow startup
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
