#!/usr/bin/env bash
# This is free and unencumbered software released into the public domain.

set -euo pipefail

dnf --assumeyes group install --with-optional virtualization

cat > /etc/polkit-1/localauthority/50-local.d/10-libvirt-access-kvm-group.pkla <<EOF
[Access libvirt from kvm group]
Identity=unix-group:kvm
Action=org.libvirt.unix.manage
ResultAny=yes
ResultInactive=yes
ResultActive=yes
EOF
