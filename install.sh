#!/bin/sh

SCRIPT_NAME=`readlink -f "$0"`
DISTR_DIR=`dirname "$SCRIPT_NAME"`
SUDO="sudo -H"
GIT="$SUDO /usr/bin/git"

cd /etc
if [ ! -d .git ]
then
  echo Creating a git repository
  $GIT init
fi

if [ $($GIT config user.name | wc -l) = "0" ]
then
  echo Setting git user name
  $GIT config user.name 'ETC Auto commiter'
fi

if [ $($GIT config user.email | wc -l) = "0" ]
then
  echo Setting git email
  $GIT config user.email 'etc-auto-commiter@example.com'
fi

$SUDO cp "$DISTR_DIR/etc-version.sh" /etc/cron.hourly/etc-version
$SUDO chmod 755 /etc/cron.hourly/etc-version
$SUDO chown root:root /etc/cron.hourly/etc-version
