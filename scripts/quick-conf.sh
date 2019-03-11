#!/bin/bash

#Config time setting and locales
sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen
sed -i 's/^# *\(en_US ISO-8859-1\)/\1/' /etc/locale.gen
locale-gen
echo 'LANG='$LANG >> /etc/locale.conf
unset LANG
source /etc/profile.d/locale.sh
