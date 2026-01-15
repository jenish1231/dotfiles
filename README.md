# Dotfiles

Personal dotfiles managed with GNU Stow for easy configuration management.

## Contents

- **nvim(Astrovim)**: Neovim configuration
- **tmux**: Tmux configuration

## Prerequisites

- macOS (or Linux with package manager adjustments)
- [Homebrew](https://brew.sh/) package manager
- Git

## Installation

### 1. Install Required Tools

#### Install Neovim

```bash
brew install neovim
```

#### Install Tmux

```bash
brew install tmux
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
