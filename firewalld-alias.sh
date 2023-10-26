#!/bin/bash

# Define the aliases
alias="alias fwd='sudo firewall-cmd --zone=public --permanent'"
if grep -Fxq "$alias" ~/.zshrc; then
    echo "Aliases already exist in ~/.zshrc"
else
    echo "$alias" >> ~/.zshrc
    echo "Aliases added to ~/.zshrc"
    source ~/.zshrc
fi
