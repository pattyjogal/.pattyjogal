yay -S otf-san-francisco
mkdir -p $HOME/.themes/SF-Mono-Numix-Frost
mkdir -p $HOME/.themes/SF-Mono-Numix-Frost/gnome-shell

cat > $HOME/.themes/SF-Mono-Numix-Frost/gnome-shell/gnome-shell.css <<EOF
@import url("/usr/share/themes/Numix-Frost/gnome-shell/gnome-shell.css");

stage {
    font-family: "SF Pro Display", Sans-Serif;
    font-size: 12pt;
    color: #ffffff;
}
EOF
dconf write /org/gnome/shell/extensions/user-theme/name "'SF-Mono-Numix-Frost'"
