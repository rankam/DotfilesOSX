OSX Dotfiles
============

Covers
------

 + [x] Installation
   + [x] Homebrew
   + [x] Go
   + [x] Zshell
   + [x] Common utilities (git, mercurial, wget, ssh-copy-id, htop)
 + [ ] Vim
   + [ ] Config
   + [ ] Bundles
   + [ ] Custom functions
   + [ ] Syntax
 + [ ] Tmux
 + [ ] Zshrc
 + [ ] Bash functions
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
