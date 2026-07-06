echo "==> Creando directorio temporal."
# Función de borrado

cleanup() {
    rm -rf "$WORKDIR"
}

trap cleanup EXIT

# Carpeta de clonación. Aquí se agregarán todos los clones para luego borrarlos

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
WORKDIR=$(mktemp -d)
cd "$WORKDIR"

#Hace zsh default. Puede requerir contraseña
chsh -s "$(command -v zsh)" || echo "No se pudo cambiar shell automáticamente"

#Instala oh-my-zsh

echo "==> Instalando Oh My Zsh"

export RUNZSH=no
export CHSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Extensiones
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

# powerlevel10k 

echo "==> Clonando Powerlevel10k"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

#Arma picom desde cero 

echo "==> Compilando Picom"

git clone https://github.com/yshui/picom.git
cd picom

meson setup --buildtype=release build

ninja -C build

sudo ninja -C build install

# Fondos de pantalla y fuentes

echo "==> Pasando fondos y fuentes lindas"

mkdir -p "$HOME/Pictures/Wallpapers"
cp -r "$DOTFILES_DIR/assets/wallpapers/." "$HOME/Pictures/Wallpapers/" 2>/dev/null || true

cp -r "$DOTFILES_DIR/assets/fonts/." "$HOME/.local/share/fonts/" 2>/dev/null || true

fc-cache -fv



