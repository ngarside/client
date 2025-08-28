#!/usr/bin/env bash
# This is free and unencumbered software released into the public domain.

set -euo pipefail

rpm --import https://packages.microsoft.com/keys/microsoft.asc

cat > /etc/yum.repos.d/vscode.repo <<EOF
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
autorefresh=1
type=rpm-md
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF

dnf --assumeyes install code
