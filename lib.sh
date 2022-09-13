#!/bin/bash
set -e

OS=$(uname -s)
export MACOS=
export LINUX=
if [ "$OS" == "Darwin" ]; then
  MACOS=1
elif [ "$OS" == "Linux" ]; then
  LINUX=1
fi

export DOTFILES_OUT_DIR="out"
export DOTFILES_OUT_RC="$PWD/$DOTFILES_OUT_DIR/rc"

# Create new output directory, deleting the exiting one
function create_new_out_dir {
  info "Creating new output dir"
  echo "$PWD/$DOTFILES_OUT_DIR"

  rm -rf $DOTFILES_OUT_DIR
  mkdir "$DOTFILES_OUT_DIR"

  if [ -n "$MACOS" ]; then
    shebang="#!/bin/zsh"
  elif [ -n "$LINUX" ]; then
    shebang="#!/bin/bash"
  fi

  echo "$shebang" > "$DOTFILES_OUT_RC"
  echo "# Don't edit this file directly, use init.sh scripts in Dotfiles instead" >> "$DOTFILES_OUT_RC"
  chmod +x "$DOTFILES_OUT_RC"
}

# Create a symlink
function symlink {
  from="$1"
  to="$2"

  info "Creating symlink..."
  echo "  from: $from"
  echo "  to:   $to"

  ln -sf "$1" "$2"
}

# Add snippet to the rc file, which will be rendered in the output dir
function rcadd {
  snippet="$1"

  # Trim newlines
  snippet="${snippet##$'\n'}"
  snippet="${snippet%%$'\n'}"

  info "Adding rc snippet"
  echo "$snippet"

  echo "" >> "$DOTFILES_OUT_RC"
  echo "$snippet" >> "$DOTFILES_OUT_RC"
}

function rcfinal {
  rcfile="$("$PWD"/scripts/bin/rc-file)"
  dotfiles_rcfile_path="$(realpath_tilde "$DOTFILES_OUT_RC")"
  if ! grep -q "$dotfiles_rcfile_path" "$rcfile"; then
    info "Including Dotfiles rc file in $rcfile"
    {
      echo 
      echo "# Source rc file from Dotfiles"
      echo "source $dotfiles_rcfile_path"
    } >> "$rcfile"
  fi
}

# Copy to clipboard, using OS-specific command
function clipboard {
  if [ -n "$MACOS" ]; then
    echo "$1" | pbcopy
  elif [ -n "$LINUX" ]; then
    echo "$1" | xclip -selection clipboard
  fi
}

# Run init.sh script of passed in topic and print its README
function init {
  topic="$1"

  info "Initializing $topic..."

  info "README.md"
  cat "$topic/README.md"

  $SHELL -c "source "$DOTFILES_OUT_RC" && ./"$topic"/init.sh"
}

# Get absolute path, replacing $HOME with ~
function realpath_tilde {
  path="$1"

  realpath "$path" | sed "s|$HOME|~|g"
}

# Load Dotenv file if it exists
function load_dotenv {
  path="$1"

  if [ -f "$path" ]; then
    eval "$(op inject -i "$path" | awk '{ print "export "$0 }')"
  fi
}

export BOLD_GREEN='\033[1;32m'
export NO_STYLE='\033[0m'

# Log green info line
function info {
  echo -e "\n${BOLD_GREEN}==> $1${NO_STYLE}"
}
