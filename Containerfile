# Multi-stage build
ARG FEDORA_MAJOR_VERSION=42

## Build ublue-os-triiodide
FROM quay.io/fedora/fedora-bootc:${FEDORA_MAJOR_VERSION}

# Add Vanilla First Setup
#RUN wget https://copr.fedorainfracloud.org/coprs/ublue-os/vanilla-first-setup/repo/fedora-$(rpm -E %fedora)/ublue-os-vanilla-first-setup-fedora-$(rpm -E %fedora).repo -O /etc/yum.repos.d/_copr_ublue-os-vanilla-first-setup.repo

# Add in some useful udev rules
COPY --from=ghcr.io/ublue-os/config:latest /files/ublue-os-udev-rules /

COPY etc /etc
COPY usr /usr

COPY ublue-firstboot /usr/bin

# RUN rpm-ostree override remove firefox firefox-langpacks && \
RUN dnf install -y lightdm git langpacks-en distrobox lxpolkit dmenu i3 i3lock i3status volumeicon alacritty scrot xclip podman-compose light just vte291-gtk4-devel

# Explicitly create folder and give permission for lightdm directories
RUN mkdir -p /var/cache/lightdm /var/lib/lightdm-data && \
    chown lightdm:lightdm /var/cache/lightdm /var/lib/lightdm-data

# Set boot Target
RUN systemctl set-default graphical.target
