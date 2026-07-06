#!/usr/bin/env bash

options="⏻ Apagar\n Reiniciar\n⏾ Suspender\n Bloquear\n Salir"

chosen=$(printf "$options" | rofi -dmenu -i -p "Power" -theme ~/.config/rofi/powermenu.rasi)

case "$chosen" in
  *Apagar*) systemctl poweroff ;;
  *Reiniciar*) systemctl reboot ;;
  *Suspender*) systemctl suspend ;;
  *Bloquear*) i3lock || betterlockscreen -l ;;
  *Salir*) bspc quit ;;
esac
