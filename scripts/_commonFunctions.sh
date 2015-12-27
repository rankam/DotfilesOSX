#!/bin/bash

# Returns the top level git directory
function topLevelDirectory() {
    TLD=$(git rev-parse --show-toplevel)
    echo $TLD
}

# Returns the list of files to create symlinks for
function listSymlinkFiles() {
    find $(topLevelDirectory)\
        -not -path '*/\.*'\
        -not -path '*scripts/*'\
        -not -path '*files/*'\
        -maxdepth 2 -mindepth 2
}

# Generates a backup directory, which should be in the form of
# 'dotfiles-2015-12-26-11'
function generateBackupDirectory() {
    NOW=$(date +"%Y-%m-%d-%M")
    FILE_PREFIX="dotfiles"
    echo ${FILE_PREFIX}-${NOW}
}
