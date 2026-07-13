#!/data/data/com.termux/files/usr/bin/bash

# ==================================
# KEAD Global Installer
# ==================================

KEAD_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET="$PREFIX/bin/kead"

echo "Installing KEAD globally..."

# Make main launcher executable
chmod +x "$KEAD_DIR/kead"

# Create global launcher
cat >"$TARGET" <<EOF
#!/data/data/com.termux/files/usr/bin/bash

export KEAD_HOME="$KEAD_DIR"

exec "$KEAD_DIR/kead" "\$@"
EOF

chmod +x "$TARGET"

echo
echo "✓ KEAD installed globally"
echo "Run: kead --help"
