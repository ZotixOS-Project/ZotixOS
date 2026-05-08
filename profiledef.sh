#!/usr/bin/env bash
# shellcheck disable=SC2034


iso_name="ZotixOS-linux"
iso_version="$(date +%Y.%m.%d)"
iso_label="ZOTIXOS"
iso_application="ZotixOS Live/Main System"
install_dir="arch"
buildmodes=('iso')
bootmodes=('uefi.grub')
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=(
  '-comp xz'
  '-b 1M'
)
bootstrap_tarball_compression=('zstd' '-c' '-T0' '--auto-threads=logical' '--long' '-19')

customize_airootfs() {
  echo "[ZotixOS] Enabling services..."

  systemctl enable sddm.service
  systemctl enable NetworkManager.service

  echo "[ZotixOS] Creating live user..."

  useradd -m -G wheel,audio,video -s /bin/bash liveuser

  echo "liveuser:live" | chpasswd

  passwd -l root

  echo "[ZotixOS] Configuring sudo..."
  echo "%wheel ALL=(ALL:ALL) ALL" > /etc/sudoers.d/wheel
  chmod 440 /etc/sudoers.d/wheel

  echo "[ZotixOS] Configuring root..."


}
