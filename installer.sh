#!/bin/bash
echo "This script will install the theme and configure lightdm to use it."
echo "You might need to enter the root password."

sudo cd "$(dirname "$0")"

sudo cat << EOF > /etc/lightdm/lightdm.conf.d/70-linuxmint.conf
[SeatDefaults]
user-session=cinnamon
greeter-session=lightdm-webkit-greeter

EOF

sudo cd ../
sudo mv win7-mint-webkit-greeter-english-with-install-scripts /usr/share/lightdm-webkit/themes/
sudo chmod 777 -R /usr/share/lightdm-webkit/themes/win7-mint-webkit-greeter-english-with-install-scripts/

sudo lineTheme=$(grep "webkit-theme=" /etc/lightdm/lightdm-webkit-greeter.conf)
sudo sed -i "s/$lineTheme/webkit-theme=win7-mint-webkit-greeter-english-with-install-scripts/g" \
sudo /etc/lightdm/lightdm-webkit-greeter.conf
