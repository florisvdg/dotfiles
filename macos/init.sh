#!/bin/bash
# shellcheck source=../lib.sh
. lib.sh

# Disable "natural" scroll
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Show the ~/Library folder
chflags nohidden ~/Library

# Always open everything in Finder's list view
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Show status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

rcadd '
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
'
