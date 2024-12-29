export DOTFILES_FOLDER="$HOME/dotfiles"

# detect operating system
unameOut="$(uname -s)"
case "${unameOut}" in
Linux*) machine=Linux ;;
Darwin*) machine=Mac ;;
CYGWIN*) machine=Cygwin ;;
MINGW*) machine=MinGw ;;
*) machine="UNKNOWN:${unameOut}" ;;
esac

# Global Aliases and settings
ln -s "$DOTFILES_FOLDER/.aliases" "$HOME/.aliases"

# Mac only settings
if [ "$machine" = "Darwin" ] || [ "$machine" = "Mac" ]; then
  ln -s "$DOTFILES_FOLDER/.osxrc" "$HOME/.osxrc"
  ln -s "$DOTFILES_FOLDER/lazygit" "$HOME/Library/Application Support/lazygit"
fi
# Linux only settings
if [ "$machine" = "Linux" ]; then
  ln -s "$DOTFILES_FOLDER/.linuxrc" "$HOME/.linuxrc"
  ln -s "$DOTFILES_FOLDER/lazygit" "$XDG_CONFIG_HOME/lazygit"
fi
ln -s "$DOTFILES_FOLDER/nvim" "$HOME/.config/nvim"
ln -s "$DOTFILES_FOLDER/.tmux.conf" "$HOME/.tmux.conf"
# ln -s "$DOTFILES_FOLDER/.tmux" "$HOME/.tmux"
ln -s "$DOTFILES_FOLDER/kitty" "$HOME/.config/kitty"
ln -s "$DOTFILES_FOLDER/alacritty" "$HOME/.config/alacritty"
ln -s "$DOTFILES_FOLDER/wezterm" "$HOME/.config/wezterm"
ln -s "$DOTFILES_FOLDER/.gitconfig" "$HOME/.gitconfig"
ln -s "$DOTFILES_FOLDER/zsh" "$HOME/.zsh"
ln -s "$DOTFILES_FOLDER/.zshrc" "$HOME/.zshrc"
ln -s "$DOTFILES_FOLDER/starship.toml" "$HOME/.config/starship.toml"
ln -s "$DOTFILES_FOLDER/spaceship.zsh" "$HOME/.config/spaceship.zsh"
ln -s "$DOTFILES_FOLDER/aerospace" "$HOME/.config/aerospace"
ln -s "$DOTFILES_FOLDER/yazi" "$HOME/.config/yazi"
ln -s "$DOTFILES_FOLDER/ghostty" "$HOME/.config/ghostty"

# update latest zsh submodules
cd ~/.zsh && git submodule update --init --remote

# to update submodules
# git submodule update --recursive --remote

## clone tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
