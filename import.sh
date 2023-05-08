#!/bin/bash

flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

cat packages.txt | xargs flatpak install flathub --user --noninteractive

# set permissions
flatpak override --user com.valvesoftware.Steam --filesystem=xdg-config/MangoHud:ro
flatpak override --user com.heroicgameslauncher.hgl --filesystem=xdg-config/MangoHud:ro
flatpak override --user net.lutris.Lutris --filesystem=xdg-config/MangoHud:ro

flatpak override --user com.google.Chrome --filesystem=~/.local/share/applications
flatpak override --user com.google.Chrome --filesystem=~/.local/share/icons 