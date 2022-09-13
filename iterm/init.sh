#!/bin/bash
# shellcheck source=../lib.sh
. lib.sh

src_dir="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"

# Configure iTerm2 to use this directory for the preferences
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$src_dir"
