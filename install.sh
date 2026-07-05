#!/bin/bash

chmod +x packages.sh
chmod +x compile.sh

./packages.sh
./compile.sh

echo "Copiando dotfiles..."
cp -r dotfiles/* ~/.config/

echo "Instalación finalizada. DISFRUTE!"