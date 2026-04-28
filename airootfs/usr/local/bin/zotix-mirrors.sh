#!/bin/bash
set -e

echo "[ZotixOS] Running automatic reflector (no country bias)..."

reflector \
  --latest 30 \
  --protocol https \
  --sort rate \
  --number 15 \
  --save /etc/pacman.d/mirrorlist

echo "[ZotixOS] Mirrorlist generated."
