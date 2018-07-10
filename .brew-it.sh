# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
#sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed --default-names
# Install Bash 4
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
brew install bash

# Install wget with IRI support
brew install wget --with-iri

# Install more recent versions of some OS X tools
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen

# Install other useful stuff
brew install ack
brew install composer
brew install dnscrypt-proxy --with-plugins
brew install git bash-completion
brew install mackup
brew install node # This installs `npm` too using the recommended installation method
brew install p7zip
brew install tree
brew install xpdf
brew install zsh
brew install zsh-completions
brew install qcachegrind
brew linkapps

# Install dev tools
brew install php
brew install mysql
brew install postgresql
brew install redis
composer global require laravel/valet
valet install
sudo php /usr/lib/php/install-pear-nozlib.phar -d /usr/local/lib/php -b /usr/local/bin
pecl install xdebug

# Config Xdebug
echo "zend_extension=xdebug.so
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
xdebug.profiler_output_dir = '~/Projects/xdebug_profiler'
xdebug.trace_enable_trigger = 1
xdebug.trace_output_dir = '~/Projects/xdebug_traces'
xdebug.profiler_enable = 0
xdebug.trace_enable = 1
xdebug.cli_color = 1
xdebug.remote_log = '~/Projects/logs/xdebug_remote.log'" > /usr/local/etc/php/7.2/conf.d/ext-xdebug.ini

# Remove outdated versions from the cellar
brew cleanup

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# Install casks.
brew cask install alfred 2> /dev/null
brew cask install amazon-music 2> /dev/null
brew cask install dropbox 2> /dev/null
brew cask install evernote 2> /dev/null
brew cask install google-drive 2> /dev/null
brew cask install imagealpha 2> /dev/null
brew cask install imageoptim 2> /dev/null
brew cask install iterm2 2> /dev/null
brew cask install java 2> /dev/null
brew cask install skype 2> /dev/null
brew cask install slack 2> /dev/null
brew cask install sourcetree 2> /dev/null
brew cask install sublime-text 2> /dev/null
brew cask install the-unarchiver 2> /dev/null
brew cask install torbrowser 2> /dev/null
brew cask install utorrent 2> /dev/null
brew cask install vagrant 2> /dev/null
brew cask install vagrant-manager 2> /dev/null
brew cask install virtualbox 2> /dev/null
brew cask install vlc 2> /dev/null

# Install blackfire
brew tap blackfireio/homebrew-blackfire
brew install blackfire-agent
brew install blackfire-php72
echo "Config Blackfire by following these instructions: https://blackfire.io/docs/up-and-running/installation"

# Restart services
brew services restart php
brew services restart mysql
brew services restart postgresql
brew services restart redis

# Create locate DB
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist

echo "Run mackup restore when ready!"
