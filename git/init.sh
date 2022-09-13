#!/bin/bash
# shellcheck source=../lib.sh disable=SC2088
. lib.sh

src_dir="$(dirname "${BASH_SOURCE[0]}")"

# Symlink global Gitignore
symlink "$(realpath "$src_dir/.gitignore")" ~/.gitignore

load_dotenv "$src_dir/.env"

git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"
git config --global user.signingkey "$GIT_SIGNING_KEY"

# Include Gitconfig from dotfiles in global ~/.gitconfig
gitconfig_path="$(realpath_tilde "$src_dir")/.gitconfig"
if ! grep -q "$gitconfig_path" ~/.gitconfig; then
  git config --global --add include.path "$gitconfig_path"
fi

# Use SSH for the dotfiles repo
git config --local url.ssh://git@github.com/.insteadOf https://github.com/
