#!/bin/bash

APP_NAME="ClipboardApp"
DIST_DIR="dist/$APP_NAME.app"

echo "Cleaning..."
rm -rf $DIST_DIR
rm -f $APP_NAME

echo "Compiling..."
swiftc Sources/*.swift \
-framework Cocoa \
-framework ApplicationServices \
-o $APP_NAME

echo "Building app bundle..."
mkdir -p $DIST_DIR/Contents/MacOS
mkdir -p $DIST_DIR/Contents/Resources

mv $APP_NAME $DIST_DIR/Contents/MacOS/

cat > $DIST_DIR/Contents/Info.plist <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" 
"http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>

    <key>CFBundleName</key>
    <string>ClipboardApp</string>

    <key>CFBundleExecutable</key>
    <string>ClipboardApp</string>

    <key>CFBundleIdentifier</key>
    <string>com.clipboard.app</string>

    <key>CFBundleVersion</key>
    <string>1.0</string>

    <key>CFBundlePackageType</key>
    <string>APPL</string>

    <key>LSUIElement</key>
    <true/>

</dict>
</plist>
EOF

echo "Build complete: $DIST_DIR"