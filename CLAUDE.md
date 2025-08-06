# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository that uses Ansible to automate the provisioning of development machines (Mac, Ubuntu, and Debian). The repository manages shell configurations, Neovim setup, tmux configuration, and various development tools.

### Shell Preferences
- **Mac**: Zsh is the primary shell
- **Ubuntu/Debian**: Fish is the primary shell

## Key Commands

### Provisioning a Machine
```bash
# Run from the repository root
./launch

# Or manually for specific OS:
# Mac:
ansible-playbook -i playbooks/inventory playbooks/osx.yml

# Linux:
ansible-playbook -i playbooks/inventory playbooks/ubuntu.yml --ask-become-pass
```

### Common Tasks
- **Reload shell config**:
  - Fish (Ubuntu/Debian): `reload` (alias for `source ~/.config/fish/config.fish`)
  - Zsh (Mac): `source ~/.zshrc`
- **Neovim**: No plugins currently configured (minimal setup)
- **Update tmux plugins**: `~/.tmux/plugins/tpm/bin/update_plugins all`

## Architecture

### Directory Structure
- `playbooks/` - Ansible playbooks and roles for provisioning
  - `roles/common/` - Tasks for all platforms (dotfile symlinks, VIM/tmux setup)
  - `roles/osx/` - Mac-specific configurations
  - `roles/ubuntu/` - Ubuntu/Linux-specific configurations
- `home/` - Dotfiles that get symlinked to the home directory
  - `.config/nvim/` - Neovim configuration
  - `fish_config/` - Fish shell configuration (symlinked to `~/.config/fish`)
  - Various dotfiles (.tmux.conf, .gitconfig, .zshrc, etc.)
- `zshrc/` - Modular Zsh configuration files (aliases, configs, key-bindings, prompt)

### Key Design Decisions
1. **Symlink Strategy**: All dotfiles remain in the repository and are symlinked to their expected locations using Ansible's `file` module with `state=link` and `force=yes`
2. **Shell Support**: 
   - **Mac**: Zsh as primary shell with Zinit plugin manager (includes syntax highlighting, autosuggestions, z jumping, and fzf)
   - **Ubuntu/Debian**: Fish as primary shell
   - Both shells configured with modern CLI replacements (bat→cat, eza→ls, rg→grep, fd→find, delta→diff, sd→sed)
3. **Plugin Management**: 
   - Neovim uses minimal config with no plugins (by design)
   - Zsh uses Zinit for plugin management
   - tmux uses TPM (Tmux Plugin Manager)
4. **Local Overrides**: 
   - Fish: Machine-specific settings via `~/.config/fish/config_local.fish`
   - Zsh: Machine-specific settings via `~/.zshrclocal`

### Important Implementation Details
- The `launch` script auto-detects the OS and runs the appropriate playbook
- Both Fish and Zsh configs replace core utilities with modern alternatives (bat, eza, ripgrep, fd, delta, sd)
- VIM configuration includes NERDTree (F2 key), CtrlP for file search, and vim-go for Go development
- All configurations are designed to be idempotent - safe to run multiple times