# Generate new SSH key.
ssh-keygen -t rsa -b 4096 -C "user@localhost"

# Start the ssh-agent.
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# Add SSH config for Bitbucket.
echo 'Host bitbucket.org
 IdentityFile ~/.ssh/id_rsa' >> ~/.ssh/config
