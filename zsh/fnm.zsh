if (( $+commands[fnm] )); then
  # override nvm
  function nvm() {
    YELLOW='\033[0;33m'
    NC='\033[0m' # No Color
    echo -e "${YELLOW}WARNING: Using fnm${NC}\n"
    fnm $@
  }

  eval "$(fnm env --use-on-cd)"
  eval "$(fnm completions --shell zsh)"
fi