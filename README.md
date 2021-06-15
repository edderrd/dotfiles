edder's dotfiles
=================

These dotfiles are subjective, keyboard shorcuts are focused to be more efficient to use with [40% keyboard](https://github.com/foostan/crkbd).

![screenshot](docs/screenshot.png)

## Pre-requisites

- [Homebrew](https://brew.sh/)
- [iTerm](https://iterm2.com/)

## Install

Installation process is mostly based in next steps and `bin/setup.sh` script.

### Secrets

Some files could be uploaded to this repository (for security reasons) so these files must be created to store that sensitive information

```bash
touch ~/.secrets # holds any token accessible for you shell
touch ~/.gitconfig_local # your name and email
```

```ini
# example .gitconfig_local
[user]
    name = Your Name
    email = your@email.com
```

### Dependencies

```bash
brew install zsh git tmux nvim
```

### zsh

My preference is to use [prezto](https://github.com/sorin-ionescu/prezto), but also there's configurations for [oh-my-zsh](https://ohmyz.sh/)

#### setup oh-my-zsh

Follow [installation process](https://ohmyz.sh/#install)

Then link `.zshrc`, if the file already exists you can delete it and link from dotfiles repository.

```bash
ln -s ~/dotfiles/.zshrc ~/.zshrc
```

#### setup prezto

Prezto seems to have better speed overtime, also I created a [fork repository](https://github.com/edderrd/prezto) that includes my settings and a [agnoster](https://github.com/agnoster/agnoster-zsh-theme) theme that have extras like vim mode and git extra information.

Installation process could be found in [the repository](https://github.com/edderrd/prezto#installation)

### common dotfiles

Common dotfiles could be linked directly using the script

```bash
./bin/setup.sh
```

### Nerd fonts

To add icons and fancy separators you can install [nerd font](https://www.nerdfonts.com/) specific for you needs, for this dotfiles repository I use [JetBrains Mono](https://www.jetbrains.com/es-es/lp/mono/). You can install it using brew.

```bash
brew install --cask font-jetbrains-mono-nerd-font font-jetbrains-mono-nerd-font
```

### Neovim

I use [vim-plug](https://github.com/junegunn/vim-plug) to manage plugins, installation process is described in [the repository](https://github.com/junegunn/vim-plug#neovim)

Then open neovim and proceed with plugins installation.

### Alacritty Terminal (optional)

If you want to use even more minimalistic terminal and GPU accelerated you can use this terminal, dotfiles are ready linked, just need to install it.

```bash
brew install --cask alacritty
```

### Kitty Terminal (optional)

This terminal provides speed, although configuration is still in progress it support ligatures without affecting performance.

```bash
brew install --cask kitty
```

**note:** If you don't like the icon you can search for another icon with extension `.icns` and drag and drop in settings `cmd+i` in app.

