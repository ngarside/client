#!/usr/bin/env bash
# This is free and unencumbered software released into the public domain.

# Enables case insensitive completions in bash.

set -euo pipefail

cat > /etc/profile.d/ignorecase.sh <<EOF
bind -s 'set completion-ignore-case on'
EOF
