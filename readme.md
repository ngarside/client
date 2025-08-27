<!-- This is free and unencumbered software released into the public domain -->

![Fractal Design North](docs/north.jpg)

<p align=center>
	<img alt="Pro" src="https://img.shields.io/badge/pro-desktop-brightgreen?style=for-the-badge">
	&nbsp;
	<img alt="Zen" src="https://img.shields.io/badge/zen-laptop-blue?style=for-the-badge">
</p>

The GitOps codebase for my home computers.

This repo builds two container images (linked above) based on Fedora immutable spins.

# <p align=center>Map

- `common` - Shared configuration
- `pro` - Desktop specific configuration
- `zen` - Laptop specific configuration

# <p align=center>Installation

To switch to the custom image on the desktop run:

```sh
sudo bootc switch ghcr.io/ngarside/pro:latest

sudo rpm-ostree kargs \
	--append=rd.driver.blacklist=nouveau,nova_core \
	--append=modprobe.blacklist=nouveau,nova_core \
	--append=nvidia-drm.modeset=1

reboot
```

> Note that the integrated graphics must be disabled in the BIOS for the Nvidia drivers to function properly.

To switch to the custom image on the laptop run:

```sh
sudo bootc switch ghcr.io/ngarside/zen:latest

reboot
```

# <p align=center>Notes

To upgrade to the latest image run:

```sh
sudo bootc upgrade
```

To uninstall all flatpaks run:

```sh
# Leave user data
flatpak remove --all --noninteractive

# Purge user data
flatpak remove --all --noninteractive --delete-data
```

# <p align=center>License

This is free and unencumbered software released into the public domain.

The [header image](docs/north.jpg) is copyright [Fractal Design](https://www.fractal-design.com).
