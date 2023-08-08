export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"

if [ -s "$NVM_DIR/nvm.sh" ]; then

  # @see https://github.com/undg/zsh-nvm-lazy-load/tree/master
  # Create wrappers around common nvm consumers.
  # nvm, node, yarn and npm will load nvm.sh on their first invocation,
  # posing no start up time penalty for the shells that aren't going to use them at all.
  # There is only single time penalty for one shell.

  autoload -U add-zsh-hook
  load-nvm() {
      [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
  }

  nvm() {
      unset -f nvm
      load-nvm
      nvm "$@"
  }

  node() {
      unset -f node
      load-nvm
      node "$@"
  }

  npm() {
      unset -f npm
      load-nvm
      npm "$@"
  }

  yarn() {
      unset -f yarn
      load-nvm
      yarn "$@"
  }

  add-zsh-hook chpwd load-nvm
  load-nvm

fi
