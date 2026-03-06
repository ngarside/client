#!/usr/bin/env bash
# This is free and unencumbered software released into the public domain.

set -euo pipefail

dnf --assumeyes install /tmp/ec-sys-rpmbuild/noarch/ec_sys-kmod-common-1.0-6.fc43.noarch.rpm

PACKAGE=$(find /tmp/ec-sys -type f -name kmod*)
dnf --assumeyes install $PACKAGE
