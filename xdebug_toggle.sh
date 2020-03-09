#!/bin/env bash

# Simple script to enable or disable the xdebug extension on Valet setup.
if [ -z "$v" ]; then
    v="7.3"
fi

case $1 in
  on)
    [ -f /usr/local/etc/php/$v/ext-xdebug.ini.deactivated ] && sudo mv /usr/local/etc/php/$v/ext-xdebug.ini.deactivated /usr/local/etc/php/$v/conf.d/ext-xdebug.ini
    sudo brew services restart php
    sudo brew services restart nginx
    echo "Xdebug is ON"
  ;;
  off)
    [ -f /usr/local/etc/php/$v/conf.d/ext-xdebug.ini ] && sudo mv /usr/local/etc/php/$v/conf.d/ext-xdebug.ini /usr/local/etc/php/$v/ext-xdebug.ini.deactivated
    sudo brew services restart php
    sudo brew services restart nginx
    echo "Xdebug is OFF"
  ;;
  *)
    if [ -f /usr/local/etc/php/$v/conf.d/ext-xdebug.ini ]; then
      . ~/Sites/xdebug_toggle.sh off
    else
      . ~/Sites/xdebug_toggle.sh on
    fi
  ;;
esac
