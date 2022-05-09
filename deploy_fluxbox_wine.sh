#!/bin/bash

# Small-Tools
apt update && apt install -yq firefox-esr git wget curl file vim tree p7zip-full tmux
echo 'set mouse=a' >> ~/.vimrc

# Wine
apt install -yq wine 
dpkg --add-architecture i386 && apt update
apt install -yq wine32

# The Fluxbox
apt update && apt install -yq tightvncserver fluxbox xterm
mkdir /root/.vnc

# The xstartup
cat <<EOF >> ~/.vnc/xstartup
#!/bin/sh
# Uncomment the following two lines for normal desktop:
# unset SESSION_MANAGER
# exec /etc/X11/xinit/xinitrc
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
xsetroot -solid grey
vncconfig -iconic &
xterm -geometry 80x24+10+10 -ls -title "$VNCDESKTOP Desktop" &
#twm &
#gnome-session &
exec /usr/bin/fluxbox
EOF
chmod +x ~/.vnc/xstartup

# Menu
mkdir -p ~/.fluxbox
touch ~/.fluxbox/menu
cat << EOF >> ~/.fluxbox/menu
[begin](fluxbox)
[include](/etc/X11/fluxbox/fluxbox-menu)
[end]
EOF
