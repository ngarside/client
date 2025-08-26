# This is free and unencumbered software released into the public domain.

rpm-ostree install akmod-nvidia xorg-x11-drv-nvidia

echo "%_with_kmod_nvidia_open 1" > /etc/rpm/macros.nvidia-kmod

KERNEL=$(rpm -qa kernel | grep -oP '(?<=kernel-).*')

akmods --force --kernels $KERNEL --rebuild

tree /var/cache

rpm-ostree install /var/cache/akmods/nvidia/kmod-nvidia-$KERNEL-575.64.05-2.fc42.x86_64.rpm
