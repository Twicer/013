#!/bin/bash
NOW=$(date +"%Y-%m-%d")
CURRENT_DIR=$(pwd)

# We assume that the specified directory are fully qualified path.
if [ -z "$1" ]; then source_dir=$CURRENT_DIR; else source_dir="$1"; fi
if [ -z "$2" ]; then backup_dir="$CURRENT_DIR/$NOW"; else backup_dir="$2"; fi

echo "source dir is: $source_dir"
echo "backup dir is: $backup_dir"

mkdir -p $backup_dir

# not using -exec or -execdir because of possible security issue
# that we can not control when running this script on a system we don't own.
# check find man page for more detail.
for item in $(find -H $source_dir -mindepth 1 -maxdepth 1 -mtime 0 -type f,d -not -path $backup_dir)
do
	cp -r $item $backup_dir
done


# -mtime 0 finds files modified between now and 1 day ago
#  -H Do  not follow symbolic links
