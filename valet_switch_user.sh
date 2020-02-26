#!/usr/bin/env bash

valet uninstall
valet install

USER=$(whoami)

sudo chown -R $USER $(brew --prefix)/*
STR='Users\/[a-zA-Z0-9]*\/'
REPLACE="Users\/$USER\/"
REGEX="s/$STR/$REPLACE/g"

sed -i '' -e $REGEX /usr/local/etc/nginx/valet/valet.conf
sed -i '' -e $REGEX /usr/local/etc/nginx/nginx.conf
sed -i '' -e $REGEX /usr/local/etc/dnsmasq.conf

find ~/.config/valet/Nginx/*.test -type f -exec sed -i '' -e $REGEX {} \;

valet restart
