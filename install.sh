#!/bin/bash

./packages.sh
./compile.sh

echo "Copiando dotfiles..."
cp -r dotfiles/* ~/.config/

echo "Instalación finalizada. DISFRUTE!"