#!/bin/sh

# a very shell script to inject env variables with a given
# prefix into the javascript environment used in the browser. To achieve
# this, index.html is generated from a template
#
# Note: due to the sed separator used below you can't have the
# character # in these env variables

set -eu

VARS=""
LINES=$(env | egrep -i "^PETS_" || true)
CHECK=`echo $LINES | grep '#'| wc -l`
if [ $CHECK -gt 0 ]
then
  echo 'You may not use the char # in the application specific env variables. Please fix them and restart.'
  exit 1
fi

for i in $LINES
do
  KV=`echo $i | sed 's/=/:"/' | sed 's/$/"/'`
  if [ -z $VARS ]
  then
    VARS="$KV"
  else
    VARS="$VARS, $KV"
  fi
done
ENV="{$VARS}"
echo "runtime env: $ENV"

# interpolate the created string into the template
sed "s#\"%%RUNTIME_ENV%%\"#$ENV#" /usr/share/nginx/index-template.html > /usr/share/nginx/html/index.html

exec $@
