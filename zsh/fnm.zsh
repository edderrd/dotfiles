if (( $+commands[fnm] )); then
  eval "$(fnm env --use-on-cd)"
  eval "$(fnm completions --shell zsh)"
fi