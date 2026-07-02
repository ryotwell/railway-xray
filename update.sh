#!/bin/bash
set -e

echo "======================================="
echo "   Updating Railway Xray...            "
echo "======================================="

DOWNLOAD_URL="https://github.com/ryotwell/railway-xray/releases/latest/download/railway-xray-linux-amd64"
TMP_BIN="/tmp/railway-xray-update"

if command -v curl >/dev/null 2>&1; then
    echo "=> Downloading the latest version using curl..."
    curl -L -o "$TMP_BIN" "$DOWNLOAD_URL"
elif command -v wget >/dev/null 2>&1; then
    echo "=> Downloading the latest version using wget..."
    wget -O "$TMP_BIN" "$DOWNLOAD_URL"
else
    echo "Error: You need 'curl' or 'wget' installed."
    exit 1
fi

chmod +x "$TMP_BIN"

echo "=> Replacing the old binary with the new one..."
if [ "$EUID" -ne 0 ]; then
    sudo mv "$TMP_BIN" /usr/local/bin/railway-xray
else
    mv "$TMP_BIN" /usr/local/bin/railway-xray
fi

if command -v systemctl >/dev/null 2>&1; then
    if systemctl is-active --quiet railway-xray; then
        echo "=> Restarting railway-xray service..."
        sudo systemctl restart railway-xray
    fi
fi

echo ""
echo "✅ Update Complete! The latest version has been installed."
