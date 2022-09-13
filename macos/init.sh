#!/bin/bash
# shellcheck source=../lib.sh
. lib.sh

if ! grep -q "pam_tid.so" "/etc/pam.d/sudo"; then
  echo "Allow using Touch ID for sudo"
  sudo sh -c 'echo "auth sufficient pam_tid.so" >> /etc/pam.d/sudo'
fi

# Disable "natural" scroll
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Enable trackpad tap-to-click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Always open everything in Finder's list view
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Show status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Enable Dock magnification effect
defaults write com.apple.dock magnification -bool true

# Make Dock smaller
defaults write com.apple.dock tilesize -int 30
defaults write com.apple.dock largesize -int 58

# Add global shortcuts
defaults write 'Apple Global Domain' NSUserKeyEquivalents -dict-add 'System Preferences\U2026' '@$,'

# Add Tower keyboard shortcuts 
defaults write com.fournova.Tower3 NSUserKeyEquivalents -dict-add 'Fetch All Remotes' '@/'
defaults write com.fournova.Tower3 NSUserKeyEquivalents -dict-add 'Open in Terminal' '@e'
defaults write com.fournova.Tower3 NSUserKeyEquivalents -dict-add 'Quick Actions\U2026' '@k'
defaults write com.fournova.Tower3 NSUserKeyEquivalents -dict-add 'Quick Pull' '@\U2193'
defaults write com.fournova.Tower3 NSUserKeyEquivalents -dict-add 'Quick Push HEAD' '@\U2191'
defaults write com.fournova.Tower3 NSUserKeyEquivalents -dict-add 'Reveal in Finder' '@r'

rcadd '
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
'
