#!/usr/bin/env bash
# This is free and unencumbered software released into the public domain.

set -euo pipefail

dnf --assumeyes copr enable ferdiu/kernel-modules

PACKAGE=$(find /tmp/ec-sys -type f -name kmod*)
dnf --assumeyes install $PACKAGE
