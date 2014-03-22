#!/bin/bash
if [ -r /etc/lsb-release ];then
    pkg_cmd="apt-get"
elif [ -r /etc/redhat-release ];then
    pkg_cmd="yum"
fi

sudo $pkg_cmd install python-pip
sudo pip install awscli

# Install rbenv and Ruby build
if [ ! -r ~/.rbenv ];then
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
fi

# install ruby 1.9.3-p545
if [ ! -r ~/.rbenv/versions/1.9.3-p545 ];then
    rbenv install 1.9.3-p545
    rbenv rehash
fi

# Set 1.9.3-p545
rbenv global 1.9.3-p545 && echo "Ruby 1.9.3-p545 installed"

