# Dotfiles

Personal dotfiles managed with GNU Stow for easy configuration management.

## Contents

- **nvim(Astrovim)**: Neovim configuration
- **tmux**: Tmux configuration

## Tools Included

- **Neovim**: Modern Vim-based text editor
- **AstroVim**: Feature-rich Neovim configuration
- **Tmux**: Terminal multiplexer
- **zoxide**: Smarter cd command that learns your habits
- **Starship**: Fast, customizable cross-shell prompt

## Prerequisites

- macOS (or Linux with package manager adjustments)
- [Homebrew](https://brew.sh/) package manager
- Git

## Installation

### Quick Install (Automated)

```bash
git clone git@github.com:jenish1231/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

The script will:
- Install Neovim, Tmux, GNU Stow, zoxide, and Starship via Homebrew
- Backup existing configurations
- Install AstroVim
- Link all dotfiles using Stow

### Manual Installation

### 1. Install Required Tools

#### Install Neovim

```bash
brew install neovim
```

#### Install Tmux

```bash
brew install tmux
```

#### Install zoxide

```bash
brew install zoxide
```

#### Install Starship

```bash
brew install starship
```

#### Install AstroVim

```bash
# Backup existing Neovim config (if any)
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak

# Clone AstroVim
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git
```

### 2. Clone Repository

```bash
git clone git@github.com:jenish1231/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 3. Install GNU Stow

```bash
brew install stow
```

### 4. Link Configurations

Use GNU Stow to symlink the configurations you want:

```bash
# Link Neovim config (AstroVim user configuration)
stow nvim

# Link Tmux config
stow tmux

# Or link all configurations at once
stow */
```

### 5. Launch Applications

```bash
# Start Neovim (AstroVim will install plugins on first launch)
nvim

# Start Tmux
tmux
```

### 6. Configure zoxide

Add to your shell configuration file:

```bash
# For Bash (~/.bashrc)
eval "$(zoxide init bash)"

# For Zsh (~/.zshrc)
eval "$(zoxide init zsh)"

# For Fish (~/.config/fish/config.fish)
zoxide init fish | source
```

Then use `z <directory>` instead of `cd` to jump to frequently used directories.

### 7. Configure Starship

Add to your shell configuration file:

```bash
# For Bash (~/.bashrc)
eval "$(starship init bash)"

# For Zsh (~/.zshrc)
eval "$(starship init zsh)"

# For Fish (~/.config/fish/config.fish)
starship init fish | source
```

> **Note**: On first launch, Neovim/AstroVim will automatically install plugins. This may take a few minutes.

## Uninstalling

To remove symlinks created by Stow:

```bash
# Unlink specific config
stow -D nvim

# Unlink all
stow -D */
```

## Notes

- Stow creates symlinks from this directory to your home directory
- Existing config files should be backed up before running stow
- Run stow commands from the dotfiles repository root directory
