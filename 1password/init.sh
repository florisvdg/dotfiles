#!/bin/bash
# shellcheck source=../lib.sh disable=SC2016,SC2088
. lib.sh

function is_signed_in {
  ! op account ls --format json | jq length | grep -q "0"
}

if ! is_signed_in; then
  echo "Sign in to 1Password and enable the CLI & SSH in the Developer settings"
  if [ -n "$MACOS" ]; then
    echo "Press enter to continue" && read -r
    open -a /Applications/1Password.app
  fi

  until is_signed_in && op signin; do
    echo "No 1Password account found yet, trying again in 10 seconds..."
    sleep 10
  done
fi

# Determine 1Password application data directory, based on OS
if [ -n "$MACOS" ]; then
  env_OPH_DATA_DIR="~/Library/Group\ Containers/2BUA8C4S2C.com.1password/Library/Application\ Support/1Password/Data"
  env_OPH_DEBUG_DATA_DIR="$env_OPH_DATA_DIR/debug"
elif [ -n "$LINUX" ]; then
  env_OPH_DATA_DIR="~/.config/1Password"
  env_OPH_DEBUG_DATA_DIR="~/.config/Electron"
fi

rcadd '
# 1Password
export OPH_DATA_DIR='"$env_OPH_DATA_DIR"'
export OPH_DEBUG_DATA_DIR='"$env_OPH_DEBUG_DATA_DIR"'
export OPH_LOGS="$OPH_DATA_DIR/logs/1Password_rCURRENT.log"
export OPH_SETTINGS="$OPH_DATA_DIR/settings/settings.json"
export OPH_DEBUG_SETTINGS="$OPH_DEBUG_DATA_DIR/settings/settings.json"
'
