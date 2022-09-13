#!/bin/bash
# shellcheck source=../lib.sh
. lib.sh

rcadd $'
# Set prompt
PS1="%1~ $ "

# Use bash-style option+arrow word navigation
autoload -U select-word-style
select-word-style bash

# Autocomplete Makefile targets
zstyle \':completion:*:*:make:*\' tag-order \'targets\'
autoload -U compinit && compinit
'
