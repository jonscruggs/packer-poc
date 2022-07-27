# Create a webapp user
sudo adduser --disabled-password --gecos "" webapp

# Move the codebase from the tmp directory the app directory
#sudo mv /tmp/codebase/ /var/app/codebase/
#sudo chown -R webapp:webapp /var/app/
#sudo chmod 755 /var/app/codebase