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

# Generate new SSH key.
ssh-keygen -t rsa -b 4096 -C "user@localhost"

# Start the ssh-agent.
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# Add SSH config for Bitbucket.
echo 'Host bitbucket.org
 IdentityFile ~/.ssh/id_rsa' >> ~/.ssh/config
