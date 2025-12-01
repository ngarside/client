#!/usr/bin/env bash
# This is free and unencumbered software released into the public domain.

set -euo pipefail

dnf --assumeyes install \
	https://github.com/dmitry-s93/MControlCenter/releases/download/0.5.1/MControlCenter-0.5.1-Fedora_42.rpm
