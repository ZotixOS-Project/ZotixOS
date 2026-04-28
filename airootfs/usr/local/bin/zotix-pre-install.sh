#!/usr/bin/env bash

set -e

FS="${FS:-unknown}"

echo "[ZotixOS][INFO]: Preinstall check started"

if [[ "$FS" != "btrfs" ]]; then
    echo "[ZotixOS][WARN]: Snapshots and system rollback will be disabled on this filesystem."
    echo "[ZotixOS][WARN]: Recommended filesystem for full ZotixOS experience is Btrfs."
fi

echo "[ZotixOS][INFO]: Preinstall check completed"
