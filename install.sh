#!/bin/bash

set -e  

echo "Instalando las dependencias"

chmod +x packages.sh
./packages.sh

chmod +x compile.sh
./compile.sh

echo "Copiando dotfiles..."
cp -r dotfiles/* ~/.config/
mv ~/.config/.zshrc ~/

echo "Instalación finalizada. "