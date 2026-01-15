#!/bin/bash
set -euo pipefail

echo "Installing VS Code extensions..."

# Define extensions to install
EXTENSIONS=(
    # HTML/XML Auto-completion
    "formulahendry.auto-close-tag"
    "formulahendry.auto-complete-tag"
    "formulahendry.auto-rename-tag"

    # Themes & Icons
    "miguelsolorio.fluent-icons"
    "PKief.material-icon-theme"
    "zhuangtongfa.material-theme"

    # Formatters & Language Support
    "esbenp.prettier-vscode"
    "ms-python.vscode-pylance"
    "redhat.vscode-xml"
    "redhat.vscode-yaml"

    # GitHub Copilot
    "github.copilot"
    "github.copilot-chat"
)

# Install extensions using code-server CLI
for extension in "${EXTENSIONS[@]}"; do
    echo "Installing $extension..."
    code-server --install-extension "$extension" || echo "Failed to install $extension"
done

echo "VS Code extensions installation complete!"
