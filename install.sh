#!/bin/bash

# --- 🚀 Nathan's Dotfiles Setup Script ---

echo "Starting the glow-up... ✨"

# Define the source and targets
DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

# Create .config directory if it doesn't exist
mkdir -p "$CONFIG_DIR"

# 1️⃣ Link Tmux
echo "🔗 Linking Tmux..."
ln -sf "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

# 2️⃣ Link Neovim
echo "🔗 Linking Neovim..."
ln -sfn "$DOTFILES_DIR/nvim" "$CONFIG_DIR/nvim"

# 4️⃣ Link Zsh
echo "🔗 Linking Zsh config..."
ln -sf "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"

# 3️⃣ Ensure TPM is installed
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "📥 Cloning Tmux Plugin Manager..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    echo "✅ TPM already exists."
fi

echo "---------------------------------------"
echo "Technical Mastery achieved! 🎯"
echo "1. Restart your terminal."
echo "2. Inside tmux, press 'Ctrl+b' then 'U' to install plugins."
echo "3. Open nvim and let Lazy.nvim do its magic."
