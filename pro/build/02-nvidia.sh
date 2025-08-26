# This is free and unencumbered software released into the public domain.

KERNEL=$(rpm -qa kernel | grep -oP '(?<=kernel-).*')
OS=$(rpm -qa kernel | grep -oP 'fc.*')

dnf --assumeyes install akmod-nvidia xorg-x11-drv-nvidia

echo "%_with_kmod_nvidia_open 1" > /etc/rpm/macros.nvidia-kmod

akmods --force --kernels $KERNEL --rebuild

tree /var/cache

dnf --assumeyes install /var/cache/akmods/nvidia/kmod-nvidia-$KERNEL-575.64.05-2.$OS.rpm
