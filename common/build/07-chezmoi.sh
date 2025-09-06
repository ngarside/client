#!/usr/bin/env bash
# This is free and unencumbered software released into the public domain.

set -euo pipefail

ARCH=$(rpm -qa kernel | grep -oP '(?<=\.)[^.]*$')
VERSION='2.65.0'

dnf --assumeyes install \
	https://github.com/twpayne/chezmoi/releases/download/v$VERSION/chezmoi-$VERSION-$ARCH.rpm
