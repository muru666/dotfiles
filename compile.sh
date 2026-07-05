# Carpeta de clonación. Aquí se agregarán todos los clones para luego borrarlos

mkdir ClonesDotfiles
cd ClonesDotfiles

#Hace zsh default. Puede fallar :(
chsh -s "$(which zsh)" || echo "No se pudo cambiar shell automáticamente"

#Instala oh-my-zsh
export RUNZSH=no
export CHSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Extensiones
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# powerlevel10k 

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

#Arma picom desde cero 
git clone https://github.com/yshui/picom.git
cd picom

meson setup --buildtype=release build

ninja -C build

sudo ninja -C build install

# Fondos de pantalla y fuentes

mkdir -p "$HOME/Pictures/Wallpapers"
cp -r "$WORKDIR/wallpapers/"* "$HOME/Pictures/Wallpapers/" 2>/dev/null || true

mkdir -p "$HOME/.local/share/fonts"
cp -r "$WORKDIR/fonts/"* "$HOME/.local/share/fonts/" 2>/dev/null || true

fc-cache -fv

# Borrar todo
cd "$HOME"
rm -rf "$WORKDIR"