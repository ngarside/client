#!/usr/bin/env bash
# This is free and unencumbered software released into the public domain.

set -euo pipefail

RELEASE=$(rpm -E %fedora)

dnf --assumeyes install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$RELEASE.noarch.rpm
