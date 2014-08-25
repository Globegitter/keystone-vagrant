#!/usr/bin/env bash

# Get root up in here
sudo su

# Just a simple way of checking if we need to install everything
if [ ! -d "/var/www" ]
then
    # Add MongoDB to apt
    apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
    echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/10gen.list

    # Update and begin installing some utility tools
    apt-get -y update
    apt-get install -y python-software-properties
    apt-get install -y vim git subversion curl
    apt-get install -y memcached build-essential

    # Add nodejs repo
    add-apt-repository -y ppa:chris-lea/node.js
    apt-get -y update

    # Install nodejs
    apt-get install -y nodejs

    # Install latest stable version of MongoDB
    apt-get install -y mongodb-10gen

    # Install fish shell and make it your default shell
    apt-add-repository -y ppa:fish-shell/release-2
    apt-get -y update
    apt-get install -y fish
    chsh -s /usr/bin/fish

    # Symlink our host www to the guest /var/www folder
    #ln -s /vagrant/www /var/www    

    # Install Heroku toolbelt
    wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

    # Install Keystone
    npm install -g generator-keystone
    npm install pm2@latest -g

    # Huzzah!
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "If all went well, you should ready to get started with Keystone!"
    echo ""
    echo "You can login to this VM with:"
    echo "   vagrant ssh"
    echo ""
    echo "Once the Server is started you can access it under: http://localhost:3000"
    echo ""
    echo "Run 'yo keystone' in the VM to start creating your first Keystone app"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
fi
