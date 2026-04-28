#!/usr/bin/env bash
# shellcheck disable=SC2034


iso_name="ZotixOS-linux"
iso_version="0.1.0"
iso_label="ZOTIXOS"
iso_application="ZotixOS Live/Main System"
install_dir="arch"
buildmodes=('iso')
bootmodes=('uefi.systemd-boot')
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=(
  -comp xz
  -b 1M
)
bootstrap_tarball_compression=('zstd' '-c' '-T0' '--auto-threads=logical' '--long' '-19')

customize_airootfs() {
  echo "[ZotixOS] Enabling services..."

  arch-chroot "${airootfs_dir}" systemctl enable sddm.service
  arch-chroot "${airootfs_dir}" systemctl enable NetworkManager.service

  echo "[ZotixOS] Creating live user..."

  arch-chroot "${airootfs_dir}" useradd -m -G wheel,audio,video -s /bin/bash liveuser

  echo "liveuser:live" | arch-chroot "${airootfs_dir}" chpasswd

  arch-chroot "${airootfs_dir}" passwd -d root
}
