#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SHELL_DIR="$SCRIPT_DIR/shell"

echo "Installing Powerlevel10k dotfiles..."

# Install zsh if not present
if ! command -v zsh &> /dev/null; then
    echo "Installing zsh..."
    sudo apt-get update
    sudo apt-get install -y zsh
fi

# Install Oh My Zsh if not present
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install Powerlevel10k theme
P10K_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
if [ ! -d "$P10K_DIR" ]; then
    echo "Installing Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
fi

# Install zsh-autosuggestions plugin
ZSH_AUTOSUGGESTIONS_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
if [ ! -d "$ZSH_AUTOSUGGESTIONS_DIR" ]; then
    echo "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_AUTOSUGGESTIONS_DIR"
fi

# Install zsh-syntax-highlighting plugin
ZSH_SYNTAX_HIGHLIGHTING_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
if [ ! -d "$ZSH_SYNTAX_HIGHLIGHTING_DIR" ]; then
    echo "Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_SYNTAX_HIGHLIGHTING_DIR"
fi

# Symlink dotfiles
echo "Symlinking dotfiles..."
ln -sf "$SHELL_DIR/zshrc" "$HOME/.zshrc"
ln -sf "$SHELL_DIR/p10k.zsh" "$HOME/.p10k.zsh"

# Change default shell to zsh
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Changing default shell to zsh..."
    sudo chsh -s "$(which zsh)" "$USER"
fi

# Install VS Code extensions if code-server is available
if command -v code-server &> /dev/null; then
    echo "Installing VS Code extensions..."
    "$SCRIPT_DIR/vscode/install-extensions.sh"
fi

echo "Powerlevel10k installation complete!"
echo "Please restart your shell or run: exec zsh"
