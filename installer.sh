#!/bin/sh
# Mohammed Picon - direct installer
URL="https://raw.githubusercontent.com/mido00020/MohammedPicon/main/enigma2-plugin-extensions-mohammedpicon_1.5.0_all.ipk"
FILE="/tmp/mohammedpicon.ipk"
echo "Downloading Mohammed Picon..."
rm -f "$FILE"
wget -q -O "$FILE" "$URL" || wget -q --no-check-certificate -O "$FILE" "$URL"
if [ ! -s "$FILE" ]; then
    echo "Download failed. Check the internet connection."
    exit 1
fi
echo "Installing..."
opkg install --force-reinstall "$FILE"
rm -f "$FILE"
echo "Done. Restarting the GUI..."
sleep 2
killall -9 enigma2
exit 0
