#!/bin/bash

echo "Setting user infos..."
echo "export USER=$(whoami)" >> ~/.bashrc
source ~/.bashrc

echo "Installing font,xfce and vncserver"
apt update && apt install ttf-wqy-zenhei xfce4 tightvncserver -yq

echo "Setting vnc password"
vncserver&&vncserver -kill :1

echo "Configuring the xstartup"
mv ~/.vnc/xstartup ~/.vnc/xstartup.bak
cat <<EOF > ~/.vnc/xstartup
#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
EOF
cat ~/.vnc/xstartup
chmod +x ~/.vnc/xstartup

echo "Start the vncserver"
vncserver
