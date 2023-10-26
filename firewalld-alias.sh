#!/bin/bash

# Define the aliases
alias="alias fwd='sudo firewall-cmd --zone=public --permanent'"
# Check if the aliases already exist in ~/.zshrc
if grep -Fxq "$alias" ~/.zshrc; then
    echo "Aliases already exist in ~/.zshrc"
else
    # Append the aliases to ~/.zshrc if they don't exist
    echo "\n# Custom Aliases for firewall-cmd" >> ~/.zshrc
    echo "$alias" >> ~/.zshrc
    echo "Aliases added to ~/.zshrc"
fi
