#!/usr/bin/env bash
# This is free and unencumbered software released into the public domain.

set -euo pipefail

dnf --assumeyes install qt6-qtbase qt6-qtbase-gui

tar -xvzf /tmp/mcontrolcenter/scripts/MControlCenter-0.5.1-bin.tar.gz -C /tmp

( cd /tmp/MControlCenter-0.5.1-bin && ./install.sh )
