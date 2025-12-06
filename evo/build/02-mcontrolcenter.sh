#!/usr/bin/env bash
# This is free and unencumbered software released into the public domain.

set -euo pipefail

cp /tmp/mcontrolcenter/build/mcontrolcenter /usr/bin/mcontrolcenter

dnf --assumeyes install libqt6widgets6
