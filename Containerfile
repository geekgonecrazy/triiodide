# Multi-stage build
ARG FEDORA_MAJOR_VERSION=44

## Build triiodide
FROM quay.io/fedora/fedora-bootc:${FEDORA_MAJOR_VERSION}

# Extra udev rules (controllers, YubiKeys, etc.)
COPY --from=ghcr.io/ublue-os/config:latest /files/ublue-os-udev-rules /

COPY etc /etc
COPY usr /usr

COPY triiodide-firstboot /usr/bin

# RUN rpm-ostree override remove firefox firefox-langpacks && \
RUN dnf install -y lightdm git flatpak langpacks-en distrobox lxpolkit dmenu i3 i3lock i3status volumeicon alacritty scrot xclip podman-compose light just vte291-gtk4-devel

# Explicitly create folder and give permission for lightdm directories
RUN mkdir -p /var/cache/lightdm /var/lib/lightdm-data && \
    chown lightdm:lightdm /var/cache/lightdm /var/lib/lightdm-data

# Set boot Target
RUN systemctl set-default graphical.target
