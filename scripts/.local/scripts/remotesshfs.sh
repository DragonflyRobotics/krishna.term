#!/bin/zsh
set -euo pipefail

REMOTE_USER="$1"
REMOTE_HOST="$2"
REMOTE_DIR="$3"
LOCAL_MOUNT="$HOME/.sshfs/${REMOTE_HOST}"

# Create mount point
mkdir -p "$LOCAL_MOUNT"

# Mount remote directory
sshfs -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3 \
      "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR" "$LOCAL_MOUNT"

zed "$LOCAL_MOUNT"
