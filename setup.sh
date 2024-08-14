#!/bin/bash

read -p "Run apt-get update before starting? " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo -e "Running apt-get update...\n"
    sudo apt-get update
fi

if ! [ -x "$(command -v fish)" ]; then
    echo -e "\nfish not found, installing..."
    sudo apt-get install fish
else
    echo -e "\nfish already installed."
fi

if ! [ -x "$(command -v curl)" ]; then
    echo -e "\ncurl not found, installing..."
    sudo apt-get install curl
else
    echo -e "\ncurl already installed."
fi

if ! [ -x "$(command -v starship)" ]; then
    echo -e "\nstarship not found, installing..."
    curl -sS https://starship.rs/install.sh | sh
else
    echo -e "\nstarship already installed."
fi

echo -e "\nCopying files..."
cp -Rv .config/. ~/.config
