if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi
# ostali aliasi
test -s ~/.alias && . ~/.alias || true
#
export EDITOR=nano
export VISUAL=nano
export PS1="\[$(tput setaf 33)\]\u\[$(tput setaf 69)\]@\[$(tput setaf 105)\]\h \[$(tput setaf 141)\]\w \[$(tput sgr0)\]\n> "
#
#alias kopiraj='function kopiraj_fun() { if [ "$#" -eq 2 ]; then echo -n "Ste prepričani, da želite nadaljevati? (D/N): "; read -r odgovor; if [ "${odgovor,,}" = "d" ]; then sudo rsync -a --info=progress2 --delete --exclude="lost+found" --exclude=".cache" "$1/" "$2/"; else echo "Operacija preklicana."; fi; else echo "Uporaba: kopiraj vir cilj"; fi; }; kopiraj_fun'
alias kopiraj='kopiraj_fun() { if [ "$#" -eq 2 ]; then echo -n "Ste prepričani, da želite nadaljevati? (D/N): "; read -r odgovor; if [ "${odgovor:l}" = "d" ]; then sudo rsync -a --info=progress2 --delete --exclude="lost+found" --exclude=".cache" "$1/" "$2/"; else echo "Operacija preklicana."; fi; else echo "Uporaba: kopiraj vir cilj"; fi; }; kopiraj_fun'
alias top='htop'
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
#
alias fixopenfolder='xdg-mime default org.gnome.Nautilus.desktop inode/directory'
alias fixloginrefresh='sudo cp /home/$USER/.config/monitors.xml /var/lib/gdm/.config'
alias fixwinesound='sudo mkdir -p /usr/share/pipewire/pipewire-pulse.conf.d && echo "pulse.rules = [{matches = [{application.process.binary = \"wine64-preloader\" }], actions = {update-props = {pulse.min.quantum = 1024/48000}}}] " | sudo tee /usr/share/pipewire/pipewire-pulse.conf.d/wine_gaming.conf > /dev/null'
alias fixflatpakicons='flatpak --user override --filesystem=/home/$USER/.icons/:ro && flatpak --user override --filesystem=/usr/share/icons/:ro'
alias fixicons='gsettings set org.gnome.desktop.interface icon-theme "Hatter"'
alias fixmaxsound="gsettings set org.gnome.desktop.sound allow-volume-above-100-percent 'true'"
alias fixwait="gsettings set org.gnome.mutter check-alive-timeout 60000"
alias fixlaptoplid="sudo mkdir -p '/etc/systemd/logind.conf.d' && echo -e \"[Login]\\nHandleLidSwitch=ignore\" | sudo tee '/etc/systemd/logind.conf.d/99-laptop-server.conf' > '/dev/null'"
alias fixaddtog1="if grep -q docker /etc/group; then sudo usermod -a -G docker $USER; else echo 'Skupina docker ne obstaja'; fi"
alias fixaddtog2="if grep -q wheel /etc/group; then sudo usermod -a -G wheel $USER; else echo 'Skupina wheel ne obstaja'; fi"
alias fixaddtog3="if grep -q vboxusers /etc/group; then sudo usermod -a -G vboxusers $USER; else echo 'Skupina vboxusers ne obstaja'; fi"
alias fixaddtog4="if grep -q gamemode /etc/group; then sudo usermod -a -G gamemode $USER; else echo 'Skupina gamemode ne obstaja'; fi"
alias fixyasticons="sudo cp -r $HOME/.icons/$(gsettings get org.gnome.desktop.interface icon-theme | awk '{print $2}' | tr -d "'")/* /usr/share/icons/"
alias fixall="fixloginrefresh && fixwinesound && fixflatpakicons && fixicons && fixmaxsound && fixwait && fixaddtog1 && fixaddtog2 && fixaddtog3 && fixaddtog4 && fixlaptoplid && fixyasticons"
#
#fedora
#alias dnf="sudo dnf"
#alias upg="dnf upgrade -b --allowerasing -y --refresh && flatpak update -y"
#alias cleanup="dnf autoremove -y  && dnf clean all"
#ubuntu
#alias apt="sudo apt"
#alias apts="apt search"
#alias apti="apt install"
#alias aptr="apt remove"
#alias aptu="apt update"
#alias cleanup="apt clean && apt autoremove && apt autoclean"
#alias upg="apt update && apt full-upgrade -y && flatpak update -y && sudo flatpak update -y && cleanup"
#alias dpkg="sudo dpkg"
#opensuse
#alias z="sudo zypper"
#alias upg="z ref && z dup --no-confirm --allow-vendor-change && flatpak -y update"
#alias cleanup="sudo journalctl --vacuum-time=1d && sudo zypper clean && sudo zypper purge-kernels"
#manjaro
alias pacman="sudo pacman"
alias unlck="sudo rm /var/lib/pacman/db.lck"
neofetch --disable packages
