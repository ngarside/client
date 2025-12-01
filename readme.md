<!-- This is free and unencumbered software released into the public domain -->

![Fractal Design North](media/north.jpg)

<p align=center>
	<a href="https://github.com/ngarside/client/pkgs/container/evo">
		<img alt="Evo" src="https://img.shields.io/badge/evo-prestige-red?style=for-the-badge">
	</a>
	&nbsp;
	<a href="https://github.com/ngarside/client/pkgs/container/pro">
		<img alt="Pro" src="https://img.shields.io/badge/pro-desktop-brightgreen?style=for-the-badge">
	</a>
	&nbsp;
	<a href="https://github.com/ngarside/client/pkgs/container/zen">
		<img alt="Zen" src="https://img.shields.io/badge/zen-zenbook-blue?style=for-the-badge">
	</a>
</p>

The GitOps codebase for my home computers.

This repo builds two container images (linked above) based on Fedora immutable spins.

# <p align=center>Map

- `common` - Shared configuration
- `evo` - MSI Prestige specific configuration
- `mobile` - Laptop configuration
- `pro` - Custom desktop specific configuration
- `zen` - ASUS Zenbook specific configuration

# <p align=center>Installation

To switch to the custom image run:

```sh
# Prestige
sudo bootc switch ghcr.io/ngarside/evo

# Desktop
sudo bootc switch ghcr.io/ngarside/pro

# Zenbook
sudo bootc switch ghcr.io/ngarside/zen
```

# <p align=center>Quirks

On Pro the integrated graphics must be disabled in the BIOS for the Nvidia
drivers to function properly.

On Evo secureboot must be disabled for the MSI and SYS kernel modules to
function properly.

# <p align=center>Usage

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

To automatically decrypt the filesystem using the TPM chip run:

```sh
# Desktop
sudo systemd-cryptenroll --tpm2-device auto --tpm2-pcrs 1+5+7 --wipe-slot tpm2 /dev/nvme1n1p3

# Laptops
sudo systemd-cryptenroll --tpm2-device auto --tpm2-pcrs 1+5+7 --wipe-slot tpm2 /dev/nvme0n1p3
```

# <p align=center>License

This is free and unencumbered software released into the public domain.

The [header image](media/north.jpg) is copyright [Fractal Design](https://www.fractal-design.com).
