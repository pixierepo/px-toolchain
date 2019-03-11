#!/bin/bash

#Download crosstool-ng toolchain, according to: https://archlinuxarm.org/wiki/Distcc_Cross-Compiling

mkdir -p /opt
wget --no-check-certificate \
		https://archlinuxarm.org/builder/xtools/x-tools7h.tar.xz -q -O - |\
		tar -JvxC /opt
		
rm -rf /opt/x-tools7h/arm-unknown-linux-gnueabihf/build.log.bz2
chown -R root:root /opt/x-tools7h


