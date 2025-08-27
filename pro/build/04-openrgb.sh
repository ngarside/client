#!/usr/bin/env bash
# This is free and unencumbered software released into the public domain.
# Note that the ordering of options passed to OpenRGB is significant - don't modify it.

set -euo pipefail

dnf --assumeyes install openrgb

cat > /etc/systemd/system/openrgb.service <<EOF
[Unit]
Description=Apply default lighting configuration using OpenRGB

[Service]
ExecStart=openrgb --device 'ENE DRAM' --color white --mode static
RemainAfterExit=yes
RuntimeDirectory=openrgb
Type=oneshot
WorkingDirectory=/run/openrgb

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload

systemctl enable openrgb
