#!/bin/sh

cd /etc
DATE=$(/bin/date -Iseconds)

/usr/bin/git add --all .
/usr/bin/git commit -m "Autocommit: $DATE"
