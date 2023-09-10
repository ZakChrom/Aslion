#!/bin/bash

cp Aslion.png /usr/share/icons
cp ./zig-out/bin/main /usr/bin/aslion

echo "[Desktop Entry]" > Aslion.desktop
echo "Type=Application" >> Aslion.desktop
echo "Version=1.0" >> Aslion.desktop
echo "Name=Aslion" >> Aslion.desktop
echo "Comment=Astro8 Emulator by Calion" >> Aslion.desktop
echo "Path=$(readlink -f .)" >> Aslion.desktop
echo "Exec=aslion ./asm/triangle.asm" >> Aslion.desktop
echo "Icon=/usr/share/icons/Aslion.png" >> Aslion.desktop
echo "Terminal=true" >> Aslion.desktop
echo "Categories=Other" >> Aslion.desktop

mv Aslion.desktop /usr/share/applications
