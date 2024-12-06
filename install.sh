#!/bin/bash

# AppImage URL'si, ikon URL'si ve uygulama adı
APP_URL="https://download.todesktop.com/230313mzl4w4u92/cursor-0.43.6-build-241206z7j6me2e2-x86_64.AppImage"
ICON_URL="https://raw.githubusercontent.com/yusiqo/Cursor-installer/refs/heads/main/cursor.png"
APP_NAME="Cursor"
INSTALL_DIR="/opt/$APP_NAME"
sudo mkdir -p "$INSTALL_DIR"
echo "AppImage Downloading..."
curl -L "$APP_URL" -o "$INSTALL_DIR/$APP_NAME.AppImage"

sudo chmod +x "$INSTALL_DIR/$APP_NAME.AppImage"

echo "İcon Downloading..."
curl -L "$ICON_URL" -o "$INSTALL_DIR/$APP_NAME.png"

DESKTOP_FILE="/usr/share/applications/$APP_NAME.desktop"

echo "Desktop file creating..."
sudo bash -c "cat > $DESKTOP_FILE" <<EOL
[Desktop Entry]
Name=$APP_NAME
Exec=$INSTALL_DIR/$APP_NAME.AppImage
Icon=$INSTALL_DIR/$APP_NAME.png
Type=Application
Categories=Utility;
Terminal=false
EOL

# Başarılı mesajı
echo "$APP_NAME Succesfuly, icon added and app installed."
