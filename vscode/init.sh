#!/bin/bash
# shellcheck source=../lib.sh
. lib.sh

rcadd '
# VS Code
export EDITOR=("code" "-nw")
'

if [ -n "$MACOS" ]; then
  settings_path="$HOME/Library/Application Support/Code/User/settings.json"
elif [ -n "$LINUX" ]; then
  settings_path="$HOME/.config/Code/User/settings.json"
fi

if [ -f "$settings_path" ]; then
  exit 0
fi

echo "Open VS Code and run the following command palette action to configure settings sync:"
echo "workbench.userDataSync.actions.turnOn"
clipboard "workbench.userDataSync.actions.turnOn"

echo "Press enter to continue" && read -r
code -nw
