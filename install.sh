#!/bin/bash

APP_URL="https://download.todesktop.com/230313mzl4w4u92/cursor-0.43.6-build-241206z7j6me2e2-x86_64.AppImage"
ICON_URL="https://raw.githubusercontent.com/yusiqo/Cursor-installer/refs/heads/main/cursor.png"
APP_NAME="Cursor"
INSTALL_DIR="/opt/$APP_NAME"

# Create the necessary directory
sudo mkdir -p "$INSTALL_DIR"

# Download AppImage
echo "AppImage Downloading..."
sudo curl -L "$APP_URL" -o "$INSTALL_DIR/$APP_NAME.AppImage"

# Make it executable
sudo chmod +x "$INSTALL_DIR/$APP_NAME.AppImage"

# Download icon
echo "İcon Downloading..."
sudo curl -L "$ICON_URL" -o "$INSTALL_DIR/$APP_NAME.png"

# Create desktop entry
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

echo "$APP_NAME Successfully installed with icon and added to app list."
