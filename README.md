OSX Dotfiles
============

![Screenshot of Tmux + Vim](https://raw.github.com/Ganners/DotfilesOSX/master/files/screenshot_1.png)

These are my most recent dotfiles. Things to note are:

 + This is focused on Vim as an editor and uses NeoBundle
 + This is focused on programming, primarily Go
 + It's only intended to work with OSX
 + It relies on Homebrew (and it's dependencies, you'll need XCode setup)
 + It automatically generates symbolic links from files one level deep,
   ignoring the top level directory (so it can be used for organisational
   purposes). It will only generate dotfiles (I.e. it will always add the dot
   prefix to files).

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
   + [x] Powerline and theme
 + [x] Zshrc
   + [x] Oh my zsh and themes
 + [x] Installing symlinks
 + [x] Removing symlinks

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

### Installing the NeoBundle bundles

 1. Load up Vim
 2. You should be prompted to install there, press Y and wait
 3. If you are not prompted, run the command ":NeoBundleInstall"

### Installing vim-go dependencies

 1. Load up Vim
 2. Run the command ":GoInstallBinaries"
 3. Occasionally update binaries with ":GoUpdateBinaries"

### Install theme

 1. Open up files folder
 2. Double click on 'Visor.terminal' and install
 3. If you're using Total Terminal, this will work by default, otherwise open
    your terminal preferences and choose this.

## Removing symlinks

This will only remove symlinks that are pointing to this repository, so it
should be safe to run alongisde any other dotfiles you have.

    cd ~/DotfilesOSX
    bash ./scripts/removeSymlinks.sh
