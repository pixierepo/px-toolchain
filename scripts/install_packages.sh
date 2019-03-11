#!/bin/bash

pacman -Sy
pacman -S --noconfirm \
			wget \
			git \
			zip \
			unzip \
			python \
			python-pip \
			distcc

pacman -Sc