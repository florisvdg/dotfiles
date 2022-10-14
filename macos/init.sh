#!/bin/bash
# shellcheck source=../lib.sh disable=SC2016,SC2088
. lib.sh

if ! grep -q "pam_tid.so" "/etc/pam.d/sudo"; then
  echo "Allow using Touch ID for sudo"
  sudo sh -c 'echo "auth       sufficient     pam_tid.so\n$(cat /etc/pam.d/sudo)" > /etc/pam.d/sudo'
fi

# Disable "natural" scroll
defaults write -g com.apple.swipescrolldirection -bool false

# Enable trackpad tap-to-click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Set keyboard repeat speed
defaults write -g InitialKeyRepeat -float 35.0

# Set trackpad tracking speed
defaults write -g com.apple.trackpad.scaling -float 1.5

# Show the ~/Library folder
chflags nohidden ~/Library

# Always open everything in Finder's list view
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Disable smart quotes
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false

# Show status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Enable system-wide zoom with ctrl, following the pointer
sudo defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
sudo defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad HIDScrollZoomModifierMask -int 262144
sudo defaults write com.apple.universalaccess closeViewPanningMode -bool false
sudo defaults write com.apple.universalaccess closeViewPressOnReleaseOff -bool true
sudo defaults write com.apple.universalaccess closeViewSmoothImages -bool true

# Configure interactive corner: bottom left => sleep display
defaults write com.apple.dock wvous-bl-corner -int 10
defaults write com.apple.dock wvous-bl-modifier -int 0

# Enable Dock magnification effect
defaults write com.apple.dock magnification -bool true

# Make Dock smaller
defaults write com.apple.dock tilesize -int 30
defaults write com.apple.dock largesize -int 58

# Add global shortcuts
defaults write -g NSUserKeyEquivalents -dict-add 'System Preferences\U2026' '@$,'

# Add Tower keyboard shortcuts 
defaults write com.fournova.Tower3 NSUserKeyEquivalents -dict-add 'Fetch All Remotes' '@/'
defaults write com.fournova.Tower3 NSUserKeyEquivalents -dict-add 'Open in Terminal' '@e'
defaults write com.fournova.Tower3 NSUserKeyEquivalents -dict-add 'Quick Actions\U2026' '@k'
defaults write com.fournova.Tower3 NSUserKeyEquivalents -dict-add 'Quick Pull' '@\U2193'
defaults write com.fournova.Tower3 NSUserKeyEquivalents -dict-add 'Quick Push HEAD' '@\U2191'
defaults write com.fournova.Tower3 NSUserKeyEquivalents -dict-add 'Reveal in Finder' '@r'

# Add Apple Music keyboard shortcuts
defaults write com.apple.Music NSUserKeyEquivalents -dict-add 'Show Filter Field' '@f'
defaults write com.apple.Music NSUserKeyEquivalents -dict-add 'Hide Filter Field' '@f'
defaults write com.apple.Music NSUserKeyEquivalents -dict-add 'Toon filterveld' '@f' # 🇳🇱
defaults write com.apple.Music NSUserKeyEquivalents -dict-add 'Verberg filterveld' '@f' # 🇳🇱

rcadd '
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
'
