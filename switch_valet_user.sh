#!/usr/bin/env bash

# Based on: https://gist.github.com/trevorgreenleaf/2f4092b721471307e7bb9c680559c04b

# Remove valet
valet uninstall --force
rm -rf ~/.config/valet
composer global remove laravel/valet

# Change the permisions on all brew files
sudo chown -R $(whoami) $(brew --prefix)/*

# Clean up - removes logs and cache
brew cleanup

# Reinstall Process
brew tap

brew update

brew install homebrew/core/php
brew install php@7.2
brew install php@7.3
pecl install xdebug

echo 'Removing any duplicate entries for Xdebug in php.ini'

for V in 1 2 3 4 ; do
  INI=$(php -i | grep /.+/php.ini -oE | sed "s/7\.[1-4]/7.$V/g")

  if [ -f $INI ]; then
    if grep -q "xdebug.so" $INI; then
      echo $INI
      sudo sed -i '' 's/zend_extension=xdebug\.so//g' $INI
    fi
  fi
done

brew services restart mysql@5.7
brew services restart postgresql@10
brew services restart redis

composer global require laravel/valet

valet install

echo 'Parking and securing all servable Laravel sites';

cd ~/Sites
valet park

for SITES in $(find ~/Sites -maxdepth 1 -type d) ; do
  if [ -r "$SITES/public/index.php" ] && [ -w "$SITES/storage" ]; then
    cd $SITES
    valet secure
  fi
done

# Check each user for shared sites that should be parked and secured
# for USERS in $(find /Users -maxdepth 1 -type d) ; do
#   if [ $USERS != '/Users' ] && [ -d "$USERS/Sites" ] && [ -r "$USERS/Sites" ]; then
#     valet park
#
#     for SITES in $(find $USERS/Sites -maxdepth 1 -type d) ; do
#       if [ -r "$SITES/public/index.php" ] && [ -w "$SITES/storage" ]; then
#         cd $SITES
#         valet secure
#       fi
#     done
#   fi
# done
