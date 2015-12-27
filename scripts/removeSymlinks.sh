#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Import the functions
source $DIR/_commonFunctions.sh

DESTINATION_DIR=$HOME
BACKUP_DIR=$DESTINATION_DIR/$(generateBackupDirectory)

[[ -d $BACKUP_DIR ]] || mkdir $BACKUP_DIR

# List the files and do the work
for SOURCE in $(listSymlinkFiles)
do
    FILE=$(basename $SOURCE)
    BAK_DESTINATION=$BACKUP_DIR/.$FILE
    SL_DESTINATION=$DESTINATION_DIR/.$FILE

    DO_MOVE=$(ls -la $SL_DESTINATION | grep $SOURCE)
    if [[ $? != 0 ]] ; then
        echo "File $SL_DESTINATION does not link to expected symlink, skipping"
    else
        echo "Backing up file from $SL_DESTINATION to $BAK_DESTINATION"
        mv $SL_DESTINATION $BAK_DESTINATION
    fi

done

# If backup directory is empty, delete it
[ "$(ls -A $BACKUP_DIR)" ] || rm -r $BACKUP_DIR
