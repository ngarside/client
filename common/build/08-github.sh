#!/usr/bin/env bash
# This is free and unencumbered software released into the public domain.

set -euo pipefail

rpm --import https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x23F3D4EA75716059

cat > /etc/yum.repos.d/gh-cli.repo <<EOF
[gh-cli]
name=GitHub CLI
baseurl=https://cli.github.com/packages/rpm
enabled=1
gpgcheck=1
gpgkey=https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x23F3D4EA75716059
EOF

dnf --assumeyes install gh --repo gh-cli
