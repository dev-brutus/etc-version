#!/bin/sh

SCRIPT_NAME=`readlink -f "$0"`
DISTR_DIR=`dirname "$SCRIPT_NAME"`

cd /etc
if [ ! -d .git ]
then
  git init
fi

cp "$DISTR_DIR/etc-version.sh" /etc/cron.hourly/etc-version
chmod a+x /etc/cron.hourly/etc-version
chown root:root /etc/cron.hourly/etc-version
