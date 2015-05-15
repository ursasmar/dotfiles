# NOTE: This was merged with .brew-it.sh

# Add some node packages.
npm install coffee-script -g

# Bower with completions.
npm install bower -g
bower completion > /usr/local/share/bash-completion/completions/bower

# Yeoman, Bower and Grunt.
npm install --global yo bower grunt-cli
yo --version && bower --version && grunt --version

# Install the Chrome extension generator for Yeoman.
npm install -g generator-chrome-extension

# Set p4merge as default Git diff tool.
git config --global merge.tool p4mergetool
git config --global mergetool.p4mergetool.trustExitCode false
git config --global mergetool.p4mergetool.cmd "$HOME/Applications/p4merge.app/Contents/Resources/launchp4merge \$PWD/\$BASE \$PWD/\$REMOTE \$PWD/\$LOCAL \$PWD/\$MERGED"
git config --global difftool.p4mergetool.cmd "$HOME/Applications/p4merge.app/Contents/Resources/launchp4merge \$LOCAL \$REMOTE"
git config --global difftool.sourcetree.cmd "$HOME/Applications/p4merge.app/Contents/Resources/launchp4merge \$LOCAL \$REMOTE"
git config --global difftool.sourcetree.path ""
git config --global mergetool.sourcetree.cmd "$HOME/Applications/p4merge.app/Contents/Resources/launchp4merge \$PWD/\$BASE \$PWD/\$REMOTE \$PWD/\$LOCAL \$PWD/\$MERGED"
git config --global mergetool.sourcetree.trustexitcode true

# Generate new SSH key.
ssh-keygen -t rsa -b 4096 -C "joshua@ecomevolution.com"

# Start the ssh-agent.
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# Add SSH config for Bitbucket.
echo 'Host bitbucket.org
 IdentityFile ~/.ssh/id_rsa' >> ~/.ssh/config