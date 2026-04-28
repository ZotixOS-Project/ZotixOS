#!/bin/bash
set -e

if [ "$FS" = "btrfs" ]; then
    snapper -c root create-config /
    systemctl enable snapper-timeline.timer
    systemctl enable snapper-cleanup.timer
    systemctl enable grub-btrfs.path

    snapper create --description "Initial system state"
fi
