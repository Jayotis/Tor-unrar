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
        if ( find . -name '*.r*' )
            #archive found, delete extracted files. ToDo:watch for broken torrents, code for any scene file changes.
            find . ! -name '*.r*' ! -name '*.sfv' ! -name '*.nfo' ! -type f,d -delete
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
