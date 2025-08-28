#!/usr/bin/env bash
# This is free and unencumbered software released into the public domain.

set -euo pipefail

cat > /etc/dconf/db/site.d/zen.conf <<EOF
[org/gnome/desktop/background]
picture-uri='file:///usr/share/backgrounds/gnome/map-l.svg'
picture-uri-dark='file:///usr/share/backgrounds/gnome/map-d.svg'

[org/gnome/desktop/interface]
icon-theme='Papirus'

[org/gnome/desktop/peripherals/touchpad]
disable-while-typing=false

[org/gnome/desktop/wm/keybindings]
switch-applications=['<Super>Tab']
switch-applications-backward=['<Shift><Super>Tab']
switch-windows=['<Alt>Tab']
switch-windows-backward=['<Shift><Alt>Tab']

[org/gnome/settings-daemon/plugins/power]
ambient-enabled=false
idle-dim=false
EOF

dconf update
