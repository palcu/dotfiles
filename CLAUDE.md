# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository that uses Ansible to automate the provisioning of development machines (Mac, Ubuntu, and Debian). The repository manages shell configurations (Fish, Zsh), VIM setup with Vundle, tmux configuration, and various development tools.

## Key Commands

### Provisioning a Machine
```bash
# Run from the repository root
cd playbooks && ./launch

# Or manually for specific OS:
# Mac:
ansible-playbook -i playbooks/inventory playbooks/osx.yml

# Linux:
ansible-playbook -i playbooks/inventory playbooks/ubuntu.yml --ask-become-pass
```

### Common Tasks
- **Reload Fish shell config**: `reload` (alias for `source ~/.config/fish/config.fish`)
- **Update VIM plugins**: `vim +PluginInstall! +qall`
- **Update tmux plugins**: `~/.tmux/plugins/tpm/bin/update_plugins all`

## Architecture

### Directory Structure
- `playbooks/` - Ansible playbooks and roles for provisioning
  - `roles/common/` - Tasks for all platforms (dotfile symlinks, VIM/tmux setup)
  - `roles/osx/` - Mac-specific configurations
  - `roles/ubuntu/` - Ubuntu/Linux-specific configurations
- `home/` - Dotfiles that get symlinked to the home directory
  - `fish_config/` - Fish shell configuration (symlinked to `~/.config/fish`)
  - Various dotfiles (.vimrc, .tmux.conf, .gitconfig, .zshrc, etc.)

### Key Design Decisions
1. **Symlink Strategy**: All dotfiles remain in the repository and are symlinked to their expected locations using Ansible's `file` module with `state=link` and `force=yes`
2. **Shell Support**: Primary shell is Fish with aliases for modern replacements (bat→cat, eza→ls, rg→grep, fd→find, delta→diff, sd→sed)
3. **Plugin Management**: 
   - VIM uses Vundle for plugin management
   - tmux uses TPM (Tmux Plugin Manager)
4. **Local Overrides**: Fish config supports machine-specific settings via `~/.config/fish/config_local.fish`

### Important Implementation Details
- The `launch` script auto-detects the OS and runs the appropriate playbook
- Fish config replaces core utilities with modern alternatives (bat, eza, ripgrep, fd, delta, sd)
- VIM configuration includes NERDTree (F2 key), CtrlP for file search, and vim-go for Go development
- All configurations are designed to be idempotent - safe to run multiple times