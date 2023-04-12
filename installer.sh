#!/bin/bash
echo "This script will install the theme and configure lightdm to use it."
echo "You might need to enter the root password."

sudo su
cat << EOF > /etc/lightdm/lightdm.conf.d/70-linuxmint.conf
[SeatDefaults]
user-session=cinnamon
greeter-session=lightdm-webkit-greeter

EOF

cd ../
mv win7-mint-webkit-greeter-english-with-install-scripts /usr/share/lightdm-webkit/themes/
chmod 777 -R /usr/share/lightdm-webkit/themes/win7-mint-webkit-greeter-english-with-install-scripts/

lineTheme=$(grep "webkit-theme=" /etc/lightdm/lightdm-webkit-greeter.conf)
sed -i "s/$lineTheme/webkit-theme=win7-mint-webkit-greeter-english-with-install-scripts/g" \
/etc/lightdm/lightdm-webkit-greeter.conf
