# This is free and unencumbered software released into the public domain.

FROM quay.io/fedora/fedora-silverblue:43 AS ec-sys

SHELL ["/bin/bash", "-c"]

RUN dnf --assumeyes copr enable ferdiu/kernel-modules

RUN dnf --assumeyes install \
	asciidoc audit-libs-devel bindgen binutils-devel bpftool clang clippy \
	dwarves elfutils-devel fuse-devel gcc-c++ glibc-static java-devel \
	kernel-rpm-macros koji libbabeltrace-devel libbpf-devel libcap-devel \
	libcap-ng-devel libmnl-devel libnl3-devel libtraceevent-devel \
	libtracefs-devel libxml2-devel lld llvm-devel ncurses-devel net-tools \
	newt-devel nss-tools numactl-devel pciutils-devel perl perl-devel \
	perl-generators pesign python3-devel python3-docutils python3-pip \
	python3-setuptools python3-setuptools rustfmt rust-src swig \
	systemd-boot-unsigned systemd-ukify xmlto xz-devel

RUN dnf --assumeyes install ec_sys-kmod || true

RUN akmods --force --kernels $(rpm -qa kernel | grep -oP '(?<=kernel-).*') --rebuild

FROM quay.io/fedora/fedora-silverblue:43

SHELL ["/bin/bash", "-c"]

RUN --mount=target=/tmp/git set -euo pipefail && \
	for file in /tmp/git/common/build/*.sh; do bash "$file" || exit; done

RUN --mount=target=/tmp/git set -euo pipefail && \
	for file in /tmp/git/mobile/build/*.sh; do bash "$file" || exit; done

RUN --mount=target=/tmp/git \
	--mount=from=ec-sys,source=/var/cache/akmods/ec_sys,target=/tmp/ec-sys \
	set -euo pipefail && \
	for file in /tmp/git/evo/build/*.sh; do bash "$file" || exit; done

RUN rpm-ostree cleanup --repomd && \
	ostree container commit
