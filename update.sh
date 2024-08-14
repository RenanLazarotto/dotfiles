#!/bin/bash

rsync --prune-empty-dirs -r ~/.config/fish/ ./.config/fish
cp --update=all ~/.config/starship.toml ./.config