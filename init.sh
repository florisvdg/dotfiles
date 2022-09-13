#!/bin/bash
# shellcheck source=lib.sh
. lib.sh

create_new_out_dir

if [ -n "$MACOS" ]; then
  init brew
  init macos
  init zsh
  init 1password
  init ssh
  init git
  init docker
  init vscode
  init scripts
  rcfinal
elif [ -n "$LINUX" ]; then
  echo "TODO: Linux support"
else
  echo "$OS is not supported"
fi

info "Done!"
