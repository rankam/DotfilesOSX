OSX Dotfiles
============

Covers
------

 + [x] Installation
   + [x] Homebrew
   + [x] Go
   + [x] Zshell
   + [x] Common utilities (git, mercurial, wget, ssh-copy-id, htop)
 + [x] Vim
   + [x] Config
   + [x] Bundles
   + [x] Custom functions
   + [x] Syntax
 + [x] Tmux
 + [x] Zshrc
 + [ ] Installing symlinks
 + [ ] Removing symlinks

Installation
------------

### Download

    cd ~/
    git clone https://github.com/Ganners/DotfilesOSX
    cd DotfilesOSX

#### Or if git isn't installed, download and unzip to ~/:

    https://github.com/Ganners/DotfilesOSX/archive/master.zip

### Install stuff

    bash ./scripts/install.sh

### Setup symlinks

    bash ./scripts/makeSymlinks.sh
