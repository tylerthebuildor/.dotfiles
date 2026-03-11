#!/usr/bin/env bash
set -e

DOTFILES_DIR="$HOME/.dotfiles"
DOTFILES_REPO="https://github.com/tylerbuchea/.dotfiles.git"

# Install oh-my-zsh if not present
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "oh-my-zsh already installed."
fi

# Clone dotfiles repo if not present
if [ ! -d "$DOTFILES_DIR" ]; then
  echo "Cloning dotfiles..."
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
else
  echo "Dotfiles already cloned."
fi

# Add source line to .zshrc if not already there
if ! grep -q "source ~/.dotfiles/includes" "$HOME/.zshrc" 2>/dev/null; then
  echo "Adding dotfiles source to .zshrc..."
  echo 'source ~/.dotfiles/includes' >> "$HOME/.zshrc"
else
  echo "Dotfiles already sourced in .zshrc."
fi

# Set zsh plugins if not already configured
if grep -q "^plugins=(" "$HOME/.zshrc" 2>/dev/null; then
  echo "Plugins already configured in .zshrc."
else
  echo "Adding plugins to .zshrc..."
  echo 'plugins=(git z)' >> "$HOME/.zshrc"
fi

echo ""
echo "Done! Sourcing .zshrc..."
source "$HOME/.zshrc"
