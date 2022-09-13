#!/bin/bash
# shellcheck source=../lib.sh disable=SC2016
. lib.sh

src_dir="$(dirname "${BASH_SOURCE[0]}")"
bin_path="$(realpath "$src_dir")/bin"

rcadd '
# Add scripts as first entry on the $PATH
export PATH='"$bin_path"':$PATH
'
