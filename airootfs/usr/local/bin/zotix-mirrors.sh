#!/bin/bash
set -e

echo "[ZotixOS] Running automatic reflector (no country bias)..."
if [ -n "$COUNTRY" ]; then
    reflector \
        --country "$COUNTRY" \
        --latest 30 \
        --protocol https \
        --sort rate \
        --number 15 \
        --save /etc/pacman.d/mirrorlist
else
    reflector \
        --latest 30 \
        --protocol https \
        --sort rate \
        --number 15 \
        --save /etc/pacman.d/mirrorlist
fi
echo "[ZotixOS] Mirrorlist generated."
