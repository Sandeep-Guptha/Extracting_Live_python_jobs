#!/bin/bash

TSV="TsvHttpData-1.0"

IP=$(curl http://ipecho.net/plain -s)



for i in `ls -I generate.sh -I index.tsv`; do

    filesize=$(stat -c%s "$i")

    MD5Hash=$(openssl md5 -binary $i | openssl enc -base64)

    TSV="$TSV\nhttp://$IP/$i\t$filesize\t$MD5Hash"


done

echo -e $TSV > index.tsv



#Output

echo "http://$IP/index.tsv"

echo "-----"

cat index.tsv
