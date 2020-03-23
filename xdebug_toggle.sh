#!/bin/env bash

if [ -z "$v" ]; then
    # Get the currently active PHP version.
    v="$(php -v | grep -e 'PHP \d.\d' -o | grep -e '\d.\d' -o)"
fi

if [ ! -f /usr/local/etc/php/$v/conf.d/ext-xdebug.ini ]; then
  read -p "Xdebug for PHP $v is missing its conf file. Create it? " YN

  case $YN in
      [Yy]* )
      read -p "What is the absolute path to your general projects/sites dir? " PATH
      mkdir -p $PATH/xdebug
      mkdir -p $PATH/xdebug/profiler
      mkdir -p $PATH/xdebug/traces

      cat <<EOT >> /usr/local/etc/php/$v/conf.d/ext-xdebug.ini
zend_extension=xdebug.so
xdebug.var_display_max_data = -1
xdebug.var_display_max_depth = 100
xdebug.default_enable = 0
xdebug.remote_enable = 1
xdebug.remote_connect_back = 1
xdebug.remote_port = 9001
xdebug.remote_host = localhost
xdebug.remote_autostart = 1
xdebug.remote_handler = dbgp
xdebug.idekey = PHPSTORM
xdebug.collect_return = 1
xdebug.collect_params = 10
xdebug.show_mem_delta = 1
xdebug.profiler_enable_trigger = 1
xdebug.profiler_output_dir = '$PATH/xdebug/profiler'
xdebug.trace_enable_trigger = 1
xdebug.trace_output_dir = '$PATH/xdebug/traces'
xdebug.profiler_enable = 0
xdebug.trace_enable = 1
xdebug.cli_color = 1
xdebug.remote_log = '$PATH/xdebug/remote.log'
EOT
      ;;
      [Nn]* ) ;;
      * ) echo "Please answer yes or no.";;
  esac
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

case $1 in
  on)
    sed -i '' '1s/^.//' /usr/local/etc/php/$v/conf.d/ext-xdebug.ini
    brew services restart php@$v
    brew services restart nginx
    echo "Xdebug is ON"
  ;;
  off)
    sed -i '' '1s/^/;/' /usr/local/etc/php/$v/conf.d/ext-xdebug.ini
    brew services restart php@$v
    brew services restart nginx
    echo "Xdebug is OFF"
  ;;
  *)
    if [ $(head -c 1 < /usr/local/etc/php/$v/conf.d/ext-xdebug.ini) == ";" ]; then
      bash $DIR/xdebug_toggle.sh on
    else
      bash $DIR/xdebug_toggle.sh off
    fi
  ;;
esac
