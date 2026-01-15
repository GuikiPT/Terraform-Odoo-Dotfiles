# Coder Workspace Dotfiles

This repository contains dotfiles for Coder workspaces with Powerlevel10k theme and VS Code configuration.

## Structure

```plaintext
.
├── install.sh              # Main installation script
├── shell/                  # Shell configurations
│   ├── zshrc              # Zsh configuration
│   └── p10k.zsh           # Powerlevel10k theme configuration
├── vscode/                 # VS Code configurations
│   └── install-extensions.sh  # VS Code extension installer
├── .vscode/                # VS Code workspace settings
│   ├── extensions.json    # Recommended extensions
│   └── settings.json      # Workspace settings
└── README.md              # This file
```

## What's Included

### Shell Configuration
- **Oh My Zsh**: Popular zsh framework
- **Powerlevel10k**: Fast and customizable zsh theme
- **Plugins**: git, zsh-autosuggestions, zsh-syntax-highlighting, and more
- **Key bindings**: Full support for Alt/Ctrl + arrow keys, Home/End, Delete, etc.

### VS Code Configuration
- **Recommended extensions**: GitLens, Python, Docker, Terraform, and more
- **Workspace settings**: Pre-configured editor, terminal, and language-specific settings
- **Automatic installation**: Extensions are installed automatically when using code-server

## Installation

Run the install script:

```bash
./install.sh
```

Then restart your shell:

```bash
exec zsh
```

## Customization

### Shell
- Edit `shell/zshrc` to add more plugins or change settings
- Run `p10k configure` to reconfigure Powerlevel10k interactively
- Edit `shell/p10k.zsh` directly for advanced customization

### VS Code
- Edit `.vscode/extensions.json` to add/remove recommended extensions
- Edit `.vscode/settings.json` to customize workspace settings
- Edit `vscode/install-extensions.sh` to modify which extensions are auto-installed

## Using with Coder

In your Coder template, add:

```hcl
module "dotfiles" {
  source   = "registry.coder.com/modules/dotfiles/coder"
  version  = "1.0.15"
  agent_id = coder_agent.main.id
  repo_url = "https://github.com/GuikiPT/Terraform-Odoo-Dotfiles"
}
```
