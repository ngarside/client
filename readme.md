<!-- This is free and unencumbered software released into the public domain -->

# <p align=center>PC

The GitOps codebase for my home PC.

# <p align=center>Setup

Switch to the custom image:

> Integrated graphics & secure boot must be disabled in BIOS.

```sh
sudo bootc switch ghcr.io/ngarside/pro:latest

sudo rpm-ostree kargs --append=rd.driver.blacklist=nouveau,nova_core --append=modprobe.blacklist=nouveau,nova_core --append=nvidia-drm.modeset=1

reboot
```

# <p align=center>Notes

Upgrade to the latest image:

```sh
sudo bootc upgrade
```

Uninstall all flatpaks:

```sh
flatpak remove --all --noninteractive # --delete-data # Uncomment to delete all data
```

# <p align=center>License

This is free and unencumbered software released into the public domain.
