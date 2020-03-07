#!/bin/bash
if [ -f skip_it ]; then 
    exit
elif [ -f got_it ]
then
    made=$(stat -c %Y got_it)
    now=$(date +"%s")
    #wait 3 days for applications to find and copy
    if (( (now - made) > (259200) ))
    then
        #delete any other extracted files and leave onlu these types ToDo:exception handling
        find . ! -name '*.r*' ! -name '*.sfv' ! -name '*.nfo' ! -name '*.mkv' -type f,d -delete
        rm got_it
        touch skip_it
        #mark this directory as processed
    fi
    exit
#not processed or waiting, unpack video
else
    mkdir tmp
    unrar x -o- *.rar tmp
    mv tmp/* ./
    rm -d tmp
    touch got_it
#mark directory has having a file ready for copy
fi
