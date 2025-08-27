#!/usr/bin/env bash
# This is free and unencumbered software released into the public domain.

# Alias 'la' to 'ls -la'

set -euo pipefail

cat > /etc/profile.d/la.sh <<EOF
alias la="ls -la"
EOF
