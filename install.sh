#!/bin/bash

echo "Instalando las dependencias"

chmod +x packages.sh
./packages.sh

chmod +x compile.sh
./compile.sh

echo "Copiando dotfiles..."
cp -r dotfiles/* ~/.config/

echo "Instalación finalizada. DISFRUTE!"