#!/bin/bash

# Install git submodules
git submodule init
git submodule update

# Install homebrew
which -s brew
if [[ $? != 0 ]] ; then
    echo "Installing Homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Updating Homebrew"
    brew upgrade
    brew update
fi

# Install package managers
echo "Installing package managers"
which -s git || brew install git
which -s mercurial || brew install mercurial
which -s bazaar || brew install bazaar

# Install utilities
echo "Installing utilities"
which -s vim || brew install vim
which -s tmux || brew install tmux
which -s htop || brew install htop
which -s wget || brew install wget
which -s wemux || brew install wemux
which -s ctags || brew install ctags-exuberant
which -s ssh-copy-id || brew install ssh-copy-id
which -s graphviz || brew install graphviz

# Install grep (might be required for powerline on tmux)
brew tap homebrew/dupes
brew install homebrew/dupes/grep

# Install hack powerline fonts
wget https://github.com/powerline/fonts/raw/master/Hack/Hack-Bold.ttf
wget https://github.com/powerline/fonts/raw/master/Hack/Hack-BoldItalic.ttf
wget https://github.com/powerline/fonts/raw/master/Hack/Hack-Italic.ttf
wget https://github.com/powerline/fonts/raw/master/Hack/Hack-Regular.ttf
mv Hack-* /Library/Fonts/

# Install databases
echo "Installing databases"
which -s postgresql || brew install postgresql
which -s cassandra || brew install cassandra
which -s mongodb || brew install mongodb
which -s redis || brew install redis
which -s memcached || brew install memcached

# Set zsh to the default shell
which -s zsh || brew install zsh
if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
    chsh -s $(which zsh)
fi

# Install programming languages

## Python
which -s git || brew install git
which -s python
if [[ $? != 0 ]] ; then
    echo "Installing Python"
    brew install python

    # Note: Pip should be installed with python
    pip install --upgrade pip

    # Install data science stuff
    pip install numpy
    pip install scipy
    pip install matplotlib
    pip install sympy
    pip install nose
    pip install git+https://github.com/Theano/Theano.git@feeb079
    pip install git+https://github.com/fchollet/keras.git@657b9fb
fi

## PHP
which -s php
if [[ $? != 0 ]] ; then
    echo "Installing Php"
    brew install php
    brew install php-gmagick
    brew install php-imagick
    brew install php-leveldb
    brew install php-mcrypt
    brew install php-memcache
    brew install php-memcached
    brew install php-mongo
    brew install php-protobuf
    brew install php-solr
    brew install php-xdebug
    brew install php-zookeeper

    # Install composer
    which -s composer
    if [[ $? != 0 ]] ; then
        curl -sS https://getcomposer.org/installer | php
        sudo mv composer.phar /usr/local/bin/composer
    fi
fi

## Go(lang)
which -s go
if [[ $? != 0 ]] ; then
    echo "Installing Go"

    # From the binary
    # GO_VERSION="1.5.2"
    # cd ~/Downloads/
    # wget https://storage.googleapis.com/golang/go${GO_VERSION}.darwin-amd64.pkg
    # tar -C /usr/local -xzf go${GO_VERSION}.darwin-amd64.pkg
    # Note: The path will be added when symlinks are made

    # From homebrew
    brew install golang
fi

## NodeJS
which -s node
if [[ $? != 0 ]] ; then
    echo "Installing Node"
    brew install node
fi

## Haskell (GHC)
which -s ghc
if [[ $? != 0 ]] ; then
    brew install ghc cabal-install
fi
