#!/usr/bin/env bash
# This is free and unencumbered software released into the public domain.

set -euo pipefail

dnf --assumeyes copr enable ferdiu/kernel-modules
dnf --assumeyes install asciidoc audit-libs-devel bindgen binutils-devel bpftool clang clippy dwarves elfutils-devel fuse-devel gcc-c++ glibc-static java-devel kernel-rpm-macros koji libbabeltrace-devel libbpf-devel libcap-devel libcap-ng-devel libmnl-devel libnl3-devel libtraceevent-devel libtracefs-devel libxml2-devel lld llvm-devel ncurses-devel net-tools newt-devel nss-tools numactl-devel pciutils-devel perl perl-devel perl-generators pesign python3-devel python3-docutils python3-pip python3-setuptools python3-setuptools rustfmt rust-src swig systemd-boot-unsigned systemd-ukify xmlto xz-devel
dnf --assumeyes install ec_sys-kmod

KERNEL=$(rpm -qa kernel | grep -oP '(?<=kernel-).*')
akmods --force --kernels $KERNEL --rebuild
