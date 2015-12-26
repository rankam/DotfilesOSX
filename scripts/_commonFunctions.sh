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
        -maxdepth 2 -mindepth 2
}
