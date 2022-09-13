#!/bin/bash

# Create ~/.ssh dir if it doesn't exist already
mkdir -p ~/.ssh

# Remove id_* keys we won't be using anyway
rm -rf ~/.ssh/id_*

# Create an empty allowed signers file
touch ~/.ssh/allowed_signers

src_dir="$(dirname "${BASH_SOURCE[0]}")"

# Copy SSH config, only if it doesn't exist yet
cp -n "$src_dir/config" ~/.ssh/config || :
