#!/bin/bash

usage() { echo "    Usage: $0 [FILENAME_PATH] [STRING_TO_WRITE]" 1>&2; exit 1; }

if [ $# -lt 2 ]
then
    usage
fi

if [ $1 ]
then
    filename=$1
    dir_name=$(dirname $1)
    filename="${filename##*/}"
    #echo $dir_name
    #echo "filename:$filename"

else
    echo "-First parameter needs to be a directory where to write the file."
    usage
fi

if [ $2 ] && [ -n $2 ]
then
    writestr=$2
else
    echo "-Second parameter needs to be a string."
    usage
fi

if [[ ! -d $dir_name ]]
then
    #echo "Creating the dir $dir_name"
    mkdir -p $dir_name
fi

if [ $? -eq 0 ] && ([ -n $filename ] && [ ! -e $1 ])
then
    #echo "creating the file $filename"
    touch $1
fi

if [ -d $dir_name ] && ([ -n $filename ] && [ -w $1 ])
then
    #echo "Writing to the file $filename..."
    echo $writestr > $1
else
    echo "File doesn't exist or does not have write permissions."
fi

#echo "Error while creating the DIR=$dir_name or FILE='$filename' is wrong."
