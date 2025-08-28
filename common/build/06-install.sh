#!/usr/bin/env bash
# This is free and unencumbered software released into the public domain.

set -euo pipefail

dnf --assumeyes install \
    dotnet-sdk-9.0 \
    just \
    godot \
    golang \
    nodejs \
    zig
