#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Instalando las dependencias"

bash "$SCRIPT_DIR/packages.sh"
bash "$SCRIPT_DIR/compile.sh"

echo "Copiando dotfiles..."

cp -r "$SCRIPT_DIR/dotfiles/." "$HOME/"

echo "Instalación finalizada."