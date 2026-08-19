# triiodide

[![build](https://github.com/geekgonecrazy/triiodide/actions/workflows/build.yml/badge.svg)](https://github.com/geekgonecrazy/triiodide/actions/workflows/build.yml)

A Fedora [bootc](https://bootc.dev/bootc/) image with i3 and LightDM on top of stock Fedora 44.

## Usage

To switch an existing Fedora Atomic or bootc system to the latest release (44):

```
sudo bootc switch ghcr.io/geekgonecrazy/triiodide:44
sudo reboot
```

Date tags are also published if you want a particular day's build:

```
sudo bootc switch ghcr.io/geekgonecrazy/triiodide:20260819
```

The `latest` and `stable` tags point at the current Fedora release build. When a new Fedora version ships, those tags move with it.

After the first switch, updates come from the same image:

```
sudo bootc upgrade
```

`rpm-ostree rebase` still works as a compatibility layer (`ostree-unverified-registry:ghcr.io/geekgonecrazy/triiodide:44`), but `bootc switch` is the supported path.

## Features

- Base: `quay.io/fedora/fedora-bootc:44`
- i3 (i3lock, i3status, dmenu) with LightDM
- Alacritty, volumeicon, scrot, xclip, light
- distrobox, podman-compose, git, flatpak, just
- Extra udev rules for common devices
- Flatpak updates twice a day (user and system timers)
- Graphical target by default

## Applications

Desktop apps are installed per user from Flathub on first boot, not on the base image:

- Mozilla Firefox, Mozilla Thunderbird, Extension Manager, LibreOffice, DejaDup, FontDownloader, Flatseal, and Celluloid
- Core GNOME apps from Flathub: Calculator, Calendar, Characters, Connections, Contacts, Evince, Firmware, Logs, Maps, NautilusPreviewer, TextEditor, Weather, baobab, clocks, eog, and font-viewer

## Further customization

`just` is included. On first boot the template from `/etc/justfile` is copied to your home directory.

- `just` — list tasks
- `just bios` — reboot into firmware setup
- `just changelogs` — pending update changelogs
- Distroboxes:
  - `just distrobox-boxkit`
  - `just distrobox-debian`
  - `just distrobox-opensuse`
  - `just distrobox-ubuntu`
- `just setup-flatpaks` — extra apps; edit this recipe to add your own
- `just setup-gaming` — Steam, Heroic, OBS Studio, Discord, Boatswain, Bottles, ProtonUp-Qt; MangoHud is on by default (Right Shift+F12)
- `just update` — rpm-ostree, flatpaks, and distroboxes

See the [just website](https://just.systems) for adding your own recipes.

## Verification

Images are signed with [cosign](https://docs.sigstore.dev/cosign/overview/). Download `cosign.pub` from this repo and run:

```
cosign verify --key cosign.pub ghcr.io/geekgonecrazy/triiodide
```

If you fork this repo, [generate a new keypair](https://docs.sigstore.dev/cosign/overview/) with cosign. Keep the public key in the repo and store the private key in Settings → Secrets → Actions as `SIGNING_SECRET`.

## Making your own

Fork this repo, edit the `Containerfile`, and push. See the [bootc documentation](https://docs.fedoraproject.org/en-US/bootc/) for how bootable container images work.
