#!/bin/bash

echo "Starting development environment setup."

# 1. Install Homebrew if its not installed.
if ! command -v brew &> /dev/null; then
	echo "Installing Homebrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	
	# Add brew to path for Apple Silicon Macs
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"

fi

# 2. Install Packages and Fonts
echo "Installing packages..."
brew update
brew install tmux neovim ripgrep fd
brew install --cask font-jetbrains-mono-nerd-font

# --- Clone the git repo ---
if [ ! -d "$HOME/armostheus-dev-env" ]; then
	echo "Cloning dotfiles repo..."
	git clone https://github.com/armostheus/armostheus-dev-env.git ~/armostheus-dev-env
fi

# 3. Linking configuration files.

# --- Ghostty ---
mkdir -p ~/.config/ghostty
# If a config exists and is NOT a symlink, back it up
if [ -f "$HOME/.config/ghostty/config" ] && [ ! -L "$HOME/.config/ghostty/config" ]; then
	echo "Backing up existing Ghostty config..."
	mv ~/.config/ghostty/config ~/.config/ghostty/config.bak
fi
ln -sf ~/armostheus-dev-env/ghostty/config ~/.config/ghostty/config

# --- Tmux ---
# If config exist and not a symlink, then back it up
if [ -f "$HOME/.tmux.conf" ] && [ ! -L "$HOME/.tmux.conf" ]; then
	echo "Backing up existing Tmux config..."
	mv ~/.tmux.conf ~/.tmux.conf.bak
fi
ln -sf ~/armostheus-dev-env/tmux/.tmux.conf ~/.tmux.conf

# --- Neovim ---
# Link your config to a unique name, living side by side to an existing config.
ln -sf ~/armostheus-dev-env/nvim ~/.config/armostheus-dev-env

# Create an alias in your shell profile (assuming zsh on macos) to use your config by default.
if ! grep -q "NVIM_APPNAME=armostheus-dev-env" ~/.zshrc; then
	echo -e '\n# Use custom neovim config as default' >> ~/.zshrc
	echo 'alias nvim="NVIM_APPNAME=armostheus-dev-env nvim"' >> ~/.zshrc
fi

echo "Setup complete! Restart your terminal for all change to take effect."

