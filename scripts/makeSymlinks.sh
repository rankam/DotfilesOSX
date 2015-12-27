#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Import the functions
source $DIR/_commonFunctions.sh

DESTINATION_DIR=$HOME
BACKUP_DIR=$DESTINATION_DIR/$(generateBackupDirectory)

# Check some stuff has been installed
which -s brew git tmux htop wget
if [[ $? != 0 ]] ; then
    echo "Please run install before making symlinks"
    exit
fi

[[ -d $BACKUP_DIR ]] || mkdir $BACKUP_DIR

# List the files and do the work
for SOURCE in $(listSymlinkFiles)
do
    FILE=$(basename $SOURCE)
    BAK_DESTINATION=$BACKUP_DIR/.$FILE
    SL_DESTINATION=$DESTINATION_DIR/.$FILE

    echo "Backing up file from $SL_DESTINATION to $BAK_DESTINATION"
    mv $SL_DESTINATION $BAK_DESTINATION 2>/dev/null

    echo "Creating symlink from $SOURCE to $SL_DESTINATION"
    ln -s $SOURCE $SL_DESTINATION
done

# If backup directory is empty, delete it
[ "$(ls -A $BACKUP_DIR)" ] || rm -r $BACKUP_DIR
