#!/bin/bash
# shellcheck source=../lib.sh
. lib.sh

rcadd '
# Docker
export DOCKER_SSH_FORWARD=("-v" "/run/host-services/ssh-auth.sock:/run/host-services/ssh-auth.sock" "-e" "SSH_AUTH_SOCK=/run/host-services/ssh-auth.sock")
'
