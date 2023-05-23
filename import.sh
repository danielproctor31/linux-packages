#!/bin/bash

flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

cat packages.txt | xargs flatpak install flathub --user --noninteractive

# set permissions
flatpak override --user com.valvesoftware.Steam --filesystem=xdg-config/MangoHud:ro
flatpak override --user com.heroicgameslauncher.hgl --filesystem=xdg-config/MangoHud:ro
flatpak override --user net.lutris.Lutris --filesystem=xdg-config/MangoHud:ro

flatpak override --user --filesystem=~/.local/share/applications:create --filesystem=~/.local/share/icons:create com.google.Chrome

# permission to launch applications and mouse input (input also requires udev rule: https://github.com/LizardByte/Sunshine/blob/master/src_assets/linux/misc/85-sunshine.rules)
flatpak override --user --talk-name=org.freedesktop.Flatpak dev.lizardbyte.app.Sunshine
usermod -a -G input $USER