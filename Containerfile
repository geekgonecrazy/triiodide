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
RUN dnf install -y distrobox lxpolkit dmenu i3 i3lock i3status volumeicon alacritty scrot xclip podman-compose light just vte291-gtk4-devel && \
    sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf && \
    systemctl enable rpm-ostreed-automatic.timer && \
    systemctl enable flatpak-system-update.timer && \
    rm -rf \
        /tmp/* \
        /var/*

# Set Target
RUN systemctl set-default graphical.target
