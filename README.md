# Coder Workspace Dotfiles

This repository contains dotfiles for Coder workspaces with Powerlevel10k theme.

## Structure

```plaintext
.
├── .p10k.zsh
├── .zshrc
└── install.sh
```

- **.p10k.zsh**: Powerlevel10k configuration file
- **.zshrc**: Zsh configuration file
- **install.sh**: Installation script

## What's Included

- **Oh My Zsh**: Popular zsh framework
- **Powerlevel10k**: Fast and customizable zsh theme
- **Pre-configured plugins**: git, docker, kubectl, terraform, and more

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

- Edit `.zshrc` to add more plugins or change settings
- Run `p10k configure` to reconfigure Powerlevel10k interactively
- Edit `.p10k.zsh` directly for advanced customization

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