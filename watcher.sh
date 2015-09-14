#!/bin/sh

# ./watcher.sh chp/ ./compile.sh 

OUTFILE="./compile.out"

check() {
    dir="$1"
    chsum1=`tar cf - $dir | md5sum | awk '{print $1}'`
    chsum2=$chsum1
    echo "chsum = $chsum1"
    while  [ "X$chsum1" = "X$chsum2" ]
    do
        sleep 5s
        chsum2=`tar cf - $dir | md5sum  | awk '{print $1}'`
    done

    eval $2 > $OUTFILE 2>&1
}

while true ; do check $* ; done

