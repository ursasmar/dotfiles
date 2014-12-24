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

# Install RingoJS and Narwhal
# Note that the order in which these are installed is important; see http://git.io/brew-narwhal-ringo.
brew install ringojs
brew install narwhal

# Install more recent versions of some OS X tools
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen
brew install homebrew/php/php56 --with-gmp
brew install homebrew/php/php56-xdebug

# Install other useful stuff
brew install ack
brew install composer
brew install git bash-completion
brew install node # This installs `npm` too using the recommended installation method
brew install p7zip
brew install tree
brew install xpdf
brew install zsh
brew install zsh-completions
brew install qcachegrind
brew linkapps

brew unlink bash-completion # Just in case to prevent a conflict.
brew tap homebrew/versions
brew install bash-completion2

# Remove outdated versions from the cellar
brew cleanup

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# Install casks.
brew cask install alfred 2> /dev/null
brew cask install dropbox 2> /dev/null
brew cask install evernote 2> /dev/null
brew cask install google-chrome 2> /dev/null
#brew cask install google-chrome-canary 2> /dev/null
brew cask install imagealpha 2> /dev/null
brew cask install imageoptim 2> /dev/null
brew cask install iterm2 2> /dev/null
brew cask install macvim 2> /dev/null
brew cask install miro-video-converter 2> /dev/null
brew cask install mysqlworkbench 2> /dev/null
brew cask install p4merge 2> /dev/null
brew cask install phpstorm 2> /dev/null
brew cask install sequel-pro 2> /dev/null
brew cask install sourcetree 2> /dev/null
brew cask install sublime-text 2> /dev/null
brew cask install the-unarchiver 2> /dev/null
brew cask install teamviewer 2> /dev/null
brew cask install textexpander 2> /dev/null
brew cask install torbrowser 2> /dev/null
brew cask install transmission 2> /dev/null
brew cask install ukelele 2> /dev/null
brew cask install vagrant 2> /dev/null
brew cask install virtualbox 2> /dev/null
brew cask install vlc 2> /dev/null
brew cask install xtrafinder 2> /dev/null
