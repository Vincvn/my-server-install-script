#!/bin/bash

# Define the aliases
alias_remove="alias fwd-rm='sudo firewall-cmd --zone=public --permanent --remove-port='"
alias_add="alias fwd-add='sudo firewall-cmd --zone=public --permanent --add-port='"

# Check if the aliases already exist in ~/.zshrc
if grep -Fxq "$alias_remove" ~/.zshrc && grep -Fxq "$alias_add" ~/.zshrc; then
    echo "Aliases already exist in ~/.zshrc"
else
    # Append the aliases to ~/.zshrc if they don't exist
    echo "\n# Custom Aliases for firewall-cmd" >> ~/.zshrc
    echo "$alias_remove" >> ~/.zshrc
    echo "$alias_add" >> ~/.zshrc
    echo "Aliases added to ~/.zshrc"
fi
