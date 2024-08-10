# openSUSE Tumbleweed #
#######################
# .bashrc by BArko    #
#######################
#
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
###
#
# ostali aliasi
test -s ~/.alias && . ~/.alias || true
#
kopiraj_fun() {
    if [ "$#" -ge 2 ]; then
        echo -n "Ste prepričani, da želite nadaljevati? (D/N): "
        read -r odgovor
        odgovor=$(echo "$odgovor" | tr '[:upper:]' '[:lower:]')
        if [ "$odgovor" = "d" ]; then
            sudo rsync -a --info=progress2 --delete "$@"
        else
            echo "Operacija preklicana."
        fi
    else
        echo "Uporaba: kopiraj vir cilj [dodatni parametri rsync]"
    fi
}
alias kopiraj='kopiraj_fun'
#
export EDITOR=nano
export VISUAL=nano
export PS1="\[$(tput setaf 33)\]\u\[$(tput setaf 69)\]@\[$(tput setaf 105)\]\h \[$(tput setaf 141)\]\w \[$(tput sgr0)\]\n> "
#
alias top='btop'
alias toutf8="vim --clean -E -s -c 'argdo set fileencoding=utf-8 nobomb | update' -c q -- *.srt"
alias df='df -H'
alias updatedb='sudo updatedb'
alias bios='sudo dmidecode -s bios-version'
alias reboot='sudo reboot'
alias iotop='sudo iotop'
alias db='distrobox'
alias nopassword='sudo usermod -p "" $USER'
alias setpassword='sudo passwd $USER'
alias tar='tar -cvzf'
alias untar='tar -xvzf'
alias makeiso='mkisofs -iso-level 3 -o makeiso.iso .'
alias iotop='sudo iotop -o'
alias spremembe="find . -type f -printf '%T@ %p\n' | sort -n | tail -n 10"
alias icons_restore="cp /home/$USER/.local/share/gvfs-metadata/home.$USER /home/$USER/.local/share/gvfs-metadata/home"
alias icons_backup="cp /home/$USER/.local/share/gvfs-metadata/home /home/$USER/.local/share/gvfs-metadata/home.$USER"
alias db="distrobox"
alias apkinstall="waydroid app install $1"
alias fixopenfolder='xdg-mime default org.gnome.Nautilus.desktop inode/directory'
alias fixloginrefresh="sudo cp --remove-destination ~/'.config/monitors.xml' ~gdm/'.config/monitors.xml' && sudo chown 'gdm':'gdm' ~gdm/'.config/monitors.xml'"
alias fixwinesound='sudo mkdir -p /usr/share/pipewire/pipewire-pulse.conf.d; echo "pulse.rules = [{matches = [{application.process.binary = \"wine64-preloader\" }], actions = {update-props = {pulse.min.quantum = 1024/48000}}}] " | sudo tee /usr/share/pipewire/pipewire-pulse.conf.d/wine_gaming.conf > /dev/null'
alias fixflatpakicons='flatpak --user override --filesystem=/home/$USER/.icons/:ro; flatpak --user override --filesystem=/usr/share/icons/:ro'
alias fixicons='gsettings set org.gnome.desktop.interface icon-theme "Hatter"'
alias fixmaxsound="gsettings set org.gnome.desktop.sound allow-volume-above-100-percent 'true'"
alias fixwait="gsettings set org.gnome.mutter check-alive-timeout 60000"
alias fixlaptoplid="sudo mkdir -p '/etc/systemd/logind.conf.d'; echo -e \"[Login]\\nHandleLidSwitch=ignore\" | sudo tee '/etc/systemd/logind.conf.d/99-laptop-server.conf' > '/dev/null'"
alias fixaddtog1="if grep -q docker /etc/group; then sudo usermod -a -G docker $USER; else echo 'Skupina docker ne obstaja'; fi"
alias fixaddtog2="if grep -q wheel /etc/group; then sudo usermod -a -G wheel $USER; else echo 'Skupina wheel ne obstaja'; fi"
alias fixaddtog3="if grep -q vboxusers /etc/group; then sudo usermod -a -G vboxusers $USER; else echo 'Skupina vboxusers ne obstaja'; fi"
alias fixaddtog4="if grep -q gamemode /etc/group; then sudo usermod -a -G gamemode $USER; else echo 'Skupina gamemode ne obstaja'; fi"
alias fixaddtog5="if grep -q libvirt /etc/group; then sudo usermod -a -G libvirt $USER; else echo 'Skupina libvirt ne obstaja'; fi"
alias fixyasticons="sudo cp -r $HOME/.icons/$(gsettings get org.gnome.desktop.interface icon-theme | awk '{print $2}' | tr -d "'")/* /usr/share/icons/"
alias fixwindowbuttons='gsettings set org.gnome.desktop.wm.preferences button-layout "appmenu:minimize,maximize,close"'
alias fixlocalhost="sudo hostnamectl set-hostname namiznik"
alias fixzram='echo -e "[zram0]\nzram-size = min(ram, 8192)\ncompression-algorithm = zstd" | sudo tee /usr/lib/systemd/zram-generator.conf'
alias pkoff="sudo systemctl disable --now packagekit;sudo systemctl mask packagekit"
alias pkon="sudo systemctl unmask packagekit; sudo systemctl enable --now packagekit"
alias myinstall="sudo zypper in -y gtk2 gnome-tweaks steam lutris distrobox bottles filezilla file-roller vlc neofetch gamemode virtualbox-qt opi gnome-boxes libnsl1 iotop htop gnome-calendar zram-generator btop libgthread-2_0-0 plocate; opi -n codecs; opi -n brave; opi -n megasync; opi -n vivaldi; opi -n vscodium; opi -n mystiq"
alias fixall="pkoff; myinstall; fixwindowbuttons; fixlocalhost; fixzram; fixwinesound; fixflatpakicons; fixicons; fixmaxsound; fixwait; fixaddtog1; fixaddtog2; fixaddtog3; fixaddtog4; fixaddtog5; fixlaptoplid; fixyasticons"
#
alias zypper="sudo zypper"
alias z="sudo zypper"
alias zrm="z rm --clean-deps"
alias upg='sudo zypper refresh --services; sudo zypper dist-upgrade --allow-downgrade --allow-name-change --allow-arch-change --allow-vendor-change --auto-agree-with-licenses; flatpak -y update'
alias cleanup="sudo journalctl --vacuum-time=1d; sudo zypper clean; sudo zypper purge-kernels"
alias zps="z ps -s"
#
alias backup="kopiraj /home/barko/ /run/media/barko/L_BACKUPS/barko/"
alias xampp="sudo /opt/lampp/xampp"
alias snapper="sudo snapper"
#
neofetch --disable packages
