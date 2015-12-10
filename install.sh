#!/bin/sh

SCRIPT_NAME=`readlink -f "$0"`
DISTR_DIR=`dirname "$SCRIPT_NAME"`

cd /etc
if [ ! -d .git ]
then
  git init
fi

cp "$DISTR_DIR/etc-version.sh" /etc/cron.hourly
chmod a+x /etc/cron.hourly/etc-version.sh
chown root:root /etc/cron.hourly/etc-version.sh
