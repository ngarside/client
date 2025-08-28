#!/usr/bin/env bash
# This is free and unencumbered software released into the public domain.

set -euo pipefail

mkdir --parents /usr/lib/bootc/kargs.d

cat > /usr/lib/bootc/kargs.d/nvidia.toml <<EOF
kargs = [
	"modprobe.blacklist=nouveau,nova_core",
	"nvidia-drm.modeset=1",
	"rd.driver.blacklist=nouveau,nova_core",
]
EOF
