#!/bin/bash
# shellcheck source=../lib.sh disable=SC2016
. lib.sh

# Install brew
if ! command -v brew &>/dev/null; then
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if command -v /opt/homebrew/bin/brew &>/dev/null; then
  rcadd "$(/opt/homebrew/bin/brew shellenv)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install everything in Brewfile
brew bundle install -v --file=./brew/Brewfile
