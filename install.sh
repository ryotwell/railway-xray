#!/bin/bash
set -e

echo "======================================="
echo "   Installing Latest Railway Xray      "
echo "======================================="

DOWNLOAD_URL="https://github.com/ryotwell/railway-xray/releases/latest/download/railway-xray-linux-amd64"

if command -v curl >/dev/null 2>&1; then
    echo "=> Downloading using curl..."
    curl -L -o railway-xray "$DOWNLOAD_URL"
elif command -v wget >/dev/null 2>&1; then
    echo "=> Downloading using wget..."
    wget -O railway-xray "$DOWNLOAD_URL"
else
    echo "Error: You need 'curl' or 'wget' installed on your system."
    exit 1
fi

chmod +x railway-xray

echo "=> Moving binary to /usr/local/bin (requires sudo/root access)..."
if [ "$EUID" -ne 0 ]; then
    sudo mv railway-xray /usr/local/bin/railway-xray
else
    mv railway-xray /usr/local/bin/railway-xray
fi

echo ""
echo "✅ Installation Complete!"
echo "Usage Instructions:"
echo "  1. Create a .env file in your working directory (if needed)"
echo "  2. Type 'railway-xray' to start the server"
