#!/bin/sh

cd /etc
DATE=`date -Iseconds`

git add --all .
git commit -m "Autocommit: $DATE"
