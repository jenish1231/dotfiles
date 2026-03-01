#!/bin/bash

set -e

echo "=========================================="
echo "Dotfiles Installation Script"
echo "=========================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_info() {
    echo -e "${YELLOW}➜${NC} $1"
}

# Detect OS
OS="$(uname -s)"
case "$OS" in
    Linux*)
        if [ -f /etc/os-release ]; then
            . /etc/os-release
            if [ "$ID" = "ubuntu" ] || [ "$ID_LIKE" = "debian" ]; then
                OS_TYPE="ubuntu"
                print_info "Detected Ubuntu/Debian-based system"
            else
                print_error "Unsupported Linux distribution. This script supports Ubuntu/Debian."
                exit 1
            fi
        else
            print_error "Cannot detect Linux distribution"
            exit 1
        fi
        ;;
    Darwin*)
        OS_TYPE="mac"
        print_info "Detected macOS"
        ;;
    *)
        print_error "Unsupported OS: $OS"
        exit 1
        ;;
esac

# Install package manager and packages based on OS
if [ "$OS_TYPE" = "mac" ]; then
    # Check if Homebrew is installed
    if ! command -v brew &> /dev/null; then
        print_error "Homebrew is not installed. Please install it first:"
        echo "  /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
        exit 1
    fi
    print_success "Homebrew is installed"
elif [ "$OS_TYPE" = "ubuntu" ]; then
    # Update apt cache
    print_info "Updating package cache..."
    sudo apt-get update -qq
    print_success "Package cache updated"
fi

# Install Neovim
print_info "Installing Neovim..."
if command -v nvim &> /dev/null; then
    print_success "Neovim is already installed"
else
    if [ "$OS_TYPE" = "mac" ]; then
        brew install neovim
    else
        sudo apt-get install -y neovim
    fi
    print_success "Neovim installed"
fi

# Install Tmux
print_info "Installing Tmux..."
if command -v tmux &> /dev/null; then
    print_success "Tmux is already installed"
else
    if [ "$OS_TYPE" = "mac" ]; then
        brew install tmux
    else
        sudo apt-get install -y tmux
    fi
    print_success "Tmux installed"
fi

# Install GNU Stow
print_info "Installing GNU Stow..."
if command -v stow &> /dev/null; then
    print_success "GNU Stow is already installed"
else
    if [ "$OS_TYPE" = "mac" ]; then
        brew install stow
    else
        sudo apt-get install -y stow
    fi
    print_success "GNU Stow installed"
fi

# Install zoxide
print_info "Installing zoxide..."
if command -v zoxide &> /dev/null; then
    print_success "zoxide is already installed"
else
    if [ "$OS_TYPE" = "mac" ]; then
        brew install zoxide
    else
        # Install from GitHub release for Ubuntu
        curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
    fi
    print_success "zoxide installed"
fi

# Install Starship
print_info "Installing Starship..."
if command -v starship &> /dev/null; then
    print_success "Starship is already installed"
else
    if [ "$OS_TYPE" = "mac" ]; then
        brew install starship
    else
        # Install from official script for Ubuntu
        curl -sS https://starship.rs/install.sh | sh -s -- -y
    fi
    print_success "Starship installed"
fi

# Backup existing Neovim configuration
print_info "Backing up existing Neovim configuration..."
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
if [ -d ~/.config/nvim ] || [ -L ~/.config/nvim ]; then
    mv ~/.config/nvim ~/.config/nvim.backup_$TIMESTAMP
    print_success "Backed up ~/.config/nvim to ~/.config/nvim.backup_$TIMESTAMP"
fi
if [ -d ~/.local/share/nvim ]; then
    mv ~/.local/share/nvim ~/.local/share/nvim.backup_$TIMESTAMP
    print_success "Backed up ~/.local/share/nvim"
fi
if [ -d ~/.local/state/nvim ]; then
    mv ~/.local/state/nvim ~/.local/state/nvim.backup_$TIMESTAMP
    print_success "Backed up ~/.local/state/nvim"
fi
if [ -d ~/.cache/nvim ]; then
    mv ~/.cache/nvim ~/.cache/nvim.backup_$TIMESTAMP
    print_success "Backed up ~/.cache/nvim"
fi

# Install AstroVim
print_info "Installing AstroVim..."
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git
print_success "AstroVim installed"

# Link configurations with Stow
print_info "Linking configurations with GNU Stow..."
cd "$(dirname "$0")"

# Stow nvim config
if stow nvim 2>/dev/null; then
    print_success "Linked Neovim configuration"
else
    print_error "Failed to link Neovim configuration (may already be linked)"
fi

# Stow tmux config
if stow tmux 2>/dev/null; then
    print_success "Linked Tmux configuration"
else
    print_error "Failed to link Tmux configuration (may already be linked)"
fi

echo ""
echo "=========================================="
print_success "Installation Complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo "  1. Start Neovim: nvim"
echo "     (Plugins will install automatically on first launch)"
echo "  2. Start Tmux: tmux"
echo "  3. Add zoxide to your shell config:"
echo "     - Bash: echo 'eval \"\$(zoxide init bash)\"' >> ~/.bashrc"
echo "     - Zsh: echo 'eval \"\$(zoxide init zsh)\"' >> ~/.zshrc"
echo "  4. Add Starship to your shell config:"
echo "     - Bash: echo 'eval \"\$(starship init bash)\"' >> ~/.bashrc"
echo "     - Zsh: echo 'eval \"\$(starship init zsh)\"' >> ~/.zshrc"
echo "     Then restart your shell or source the config file"
echo ""
echo "To uninstall, run:"
echo "  cd ~/dotfiles"
echo "  stow -D nvim tmux"
echo ""
