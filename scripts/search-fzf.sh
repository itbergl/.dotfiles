#!/bin/bash

# parse input
#
# if empty use root, if one arg interpret as directory to search
#
directory=$HOME
if [ "$#" -eq 1 ]; then
   directory="$1"

   if [ ! -d "$directory" ]; then
       echo "$directory is not a directory"
       exit 1
   fi
fi

cd $(find "$directory" -type d -not -path "*/.*"  | fzf)
