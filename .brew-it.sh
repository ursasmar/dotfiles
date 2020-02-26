# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

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

# Install useful tools
brew install mackup
brew install ack
brew install composer
brew install dnscrypt-proxy --with-plugins
brew install git bash-completion
brew install node # This installs `npm` too using the recommended installation method
brew install p7zip
brew install tree
brew install xpdf
brew install zsh
brew install zsh-completions
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew install qcachegrind
brew install awscli
echo "AWS CLI installed. Run 'aws configure' when ready for use."

# Install App Store apps
brew install mas
mas lucky xcode
mas lucky airmail
mas lucky todoist

# Install dev tools
brew install php@7.2
brew install php@7.3
brew install php@7.4
brew install mysql@5.7
brew install postgresql@10
brew install redis
composer global require laravel/installer
composer global require laravel/vapor
composer global require laravel/valet
valet install

# Setup sites
cp valet_switch_user.sh ~/Sites/valet_switch_user.sh
cp valet_xdebug_toggle.sh ~/Sites/valet_xdebug_toggle.sh
cd ~/Sites
valet park

pecl install xdebug

# Config Xdebug
mkdir -p ~/Sites/xdebug
XDEBUG_CONFIG = "zend_extension=xdebug.so
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
xdebug.profiler_output_dir = '~/Sites/xdebug/profiler'
xdebug.trace_enable_trigger = 1
xdebug.trace_output_dir = '~/Sites/xdebug/traces'
xdebug.profiler_enable = 0
xdebug.trace_enable = 1
xdebug.cli_color = 1
xdebug.remote_log = '~/Sites/xdebug/remote.log'"

echo $XDEBUG_CONFIG > /usr/local/etc/php/7.2/conf.d/ext-xdebug.ini
echo $XDEBUG_CONFIG > /usr/local/etc/php/7.3/conf.d/ext-xdebug.ini
echo $XDEBUG_CONFIG > /usr/local/etc/php/7.4/conf.d/ext-xdebug.ini

# Remove outdated versions from the cellar
brew cleanup

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# Install casks.
brew cask install 1password 2> /dev/null
brew cask install adobe-creative-cloud 2> /dev/null
brew cask install alfred 2> /dev/null
brew cask install amazon-music 2> /dev/null
brew cask install amazon-chime 2> /dev/null
brew cask install atom 2> /dev/null
brew cask install beyond-compare 2> /dev/null
brew cask install brave-browser 2> /dev/null
brew cask install cleanmymac 2> /dev/null
brew cask install cyberduck 2> /dev/null
brew cask install dnscrypt-proxy 2> /dev/null
brew cask install dropbox 2> /dev/null
brew cask install evernote 2> /dev/null
brew cask install electric-sheep 2> /dev/null
brew cask install gitkraken 2> /dev/null
brew cask install google-backup-and-sync 2> /dev/null
brew cask install google-chrome 2> /dev/null
brew cask install google-drive 2> /dev/null
brew cask install imagealpha 2> /dev/null
brew cask install imageoptim 2> /dev/null
brew cask install idrive 2> /dev/null
brew cask install iterm2 2> /dev/null
brew cask install java 2> /dev/null
brew cask install loom 2> /dev/null
brew cask install microsoft-office 2> /dev/null
brew cask install mindjet-mindmanager 2> /dev/null
brew cask install navicat-premium 2> /dev/null
brew cask install paragon-ntfs 2> /dev/null
brew cask install phpstorm 2> /dev/null
brew cask install postman 2> /dev/null
brew cask install qbittorrent 2> /dev/null
brew cask install quicken 2> /dev/null
brew cask install sketch 2> /dev/null
brew cask install skype 2> /dev/null
brew cask install slack 2> /dev/null
brew cask install sourcetree 2> /dev/null
brew cask install steam 2> /dev/null
brew cask install sublime-text 2> /dev/null
brew cask install the-unarchiver 2> /dev/null
brew cask install toggl 2> /dev/null
brew cask install torbrowser 2> /dev/null
brew cask install torguard 2> /dev/null
brew cask install vlc 2> /dev/null
brew cask install whatsapp 2> /dev/null
brew cask install wrike 2> /dev/null

# Install Atom packages
apm install atom-beautify

# Install blackfire
brew tap blackfireio/homebrew-blackfire
brew install blackfire-agent
brew install blackfire-php72
brew install blackfire-php73
brew install blackfire-php74
echo "Config Blackfire by following these instructions: https://blackfire.io/docs/up-and-running/installation"

# Restart services
brew services restart php@7.2
brew services restart php@7.3
brew services restart php@7.4
brew services restart mysql@5.7
brew services restart postgresql@10
brew services restart redis

# Create locate DB
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist

echo "Run mackup restore when ready!"
