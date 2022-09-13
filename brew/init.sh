#!/bin/bash
# shellcheck source=../lib.sh
. lib.sh

# Install brew
if ! command -v brew &>/dev/null; then
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install everything in Brewfile
brew bundle install --file=./brew/Brewfile
