# This is free and unencumbered software released into the public domain.

FROM docker.io/ubuntu:25.10 AS mcontrolcenter
RUN apt-get -y update
RUN apt-get -y install qt6-base-dev qt6-tools-dev build-essential libqt6widgets6 git cmake
RUN git clone https://github.com/ngarside/mcontrolcenter.git --depth 1
RUN cd /mcontrolcenter/scripts && ./build.sh

FROM quay.io/fedora/fedora-silverblue:43 AS ec-sys
RUN dnf --assumeyes group install development-tools
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
RUN dnf --assumeyes install rpm-build kernel-devel kmodtool rpmdevtools
RUN dnf --assumeyes install \
	https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
RUN dnf --assumeyes install buildsys-build-rpmfusion akmods
RUN git clone https://github.com/ngarside/ec_sys-kmod.git --depth 1
RUN mkdir /var/roothome
WORKDIR /ec_sys-kmod
RUN spectool -g -R ec_sys-kmod.spec
RUN mkdir "$(rpm --eval %_topdir)/SPECS"
RUN ln -s $(realpath ./ec_sys-kmod-common.spec) $(rpm --eval %_topdir)/SPECS/ec_sys-kmod-common.spec
RUN ln -s $(realpath ./ec_sys-kmod.spec) $(rpm --eval %_topdir)/SPECS/ec_sys-kmod.spec
RUN rpmbuild -bb ec_sys-kmod-common.spec
RUN rpmbuild -bb ec_sys-kmod.spec
RUN dnf --assumeyes install /root/rpmbuild/RPMS/noarch/ec_sys-kmod-common-1.0-6.fc43.noarch.rpm
RUN dnf --assumeyes install /root/rpmbuild/RPMS/x86_64/akmod-ec_sys-1.0-6.fc43.x86_64.rpm || true
RUN akmods --force --kernels $(rpm -qa kernel | grep -oP '(?<=kernel-).*') --rebuild

FROM quay.io/fedora/fedora-silverblue:43

SHELL ["/bin/bash", "-c"]

RUN --mount=target=/tmp/git set -euo pipefail && \
	for file in /tmp/git/common/build/*.sh; do bash "$file" || exit; done

RUN --mount=target=/tmp/git set -euo pipefail && \
	for file in /tmp/git/mobile/build/*.sh; do bash "$file" || exit; done

RUN --mount=target=/tmp/git \
	--mount=from=ec-sys,source=/root/rpmbuild/RPMS,target=/tmp/ec-sys-rpmbuild \
	--mount=from=ec-sys,source=/var/cache/akmods/ec_sys,target=/tmp/ec-sys \
	--mount=from=mcontrolcenter,source=/mcontrolcenter,target=/tmp/mcontrolcenter \
	set -euo pipefail && \
	for file in /tmp/git/evo/build/*.sh; do bash "$file" || exit; done

RUN rpm-ostree cleanup --repomd && \
	ostree container commit
