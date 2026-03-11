#!/usr/bin/env bash
set -e

DOTFILES_DIR="$HOME/.dotfiles"
DOTFILES_REPO="https://github.com/tylerthebuildor/.dotfiles.git"

# ---------------------
# Oh My Zsh
# ---------------------
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "✓ oh-my-zsh already installed."
fi

# ---------------------
# Clone dotfiles
# ---------------------
if [ ! -d "$DOTFILES_DIR" ]; then
  echo "Cloning dotfiles..."
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
else
  echo "✓ Dotfiles already cloned."
fi

# ---------------------
# Zsh config
# ---------------------
if ! grep -q "source ~/.dotfiles/includes" "$HOME/.zshrc" 2>/dev/null; then
  echo "Adding dotfiles source to .zshrc..."
  echo 'source ~/.dotfiles/includes' >> "$HOME/.zshrc"
else
  echo "✓ Dotfiles already sourced in .zshrc."
fi

if grep -q "^plugins=(" "$HOME/.zshrc" 2>/dev/null; then
  echo "✓ Plugins already configured in .zshrc."
else
  echo "Adding plugins to .zshrc..."
  echo 'plugins=(git z)' >> "$HOME/.zshrc"
fi

# ---------------------
# Vim setup
# ---------------------

# Install vim-plug if not present
if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
  echo "Installing vim-plug..."
  curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
  echo "✓ vim-plug already installed."
fi

# Install NERDTree if not present
if [ ! -d "$HOME/.vim/plugged/nerdtree" ]; then
  echo "Installing NERDTree..."
  vim -es -u "$HOME/.vimrc" +PlugInstall +qa 2>/dev/null || true
else
  echo "✓ NERDTree already installed."
fi

# Source dotfiles vim config from .vimrc
if ! grep -q "source ~/.dotfiles/vim" "$HOME/.vimrc" 2>/dev/null; then
  echo "Adding dotfiles vim config to .vimrc..."
  # Ensure vim-plug block exists
  if ! grep -q "call plug#begin" "$HOME/.vimrc" 2>/dev/null; then
    cat >> "$HOME/.vimrc" << 'VIMRC'

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
call plug#end()

source ~/.dotfiles/vim
VIMRC
  else
    echo 'source ~/.dotfiles/vim' >> "$HOME/.vimrc"
  fi
else
  echo "✓ Dotfiles vim config already sourced in .vimrc."
fi

# ---------------------
# Done
# ---------------------
echo ""
echo "✅ All done!"
source "$HOME/.zshrc"
