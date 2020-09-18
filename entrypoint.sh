#!/bin/sh -l

echo "Setting file"

perl -pi -e "s/EMAIL/$2/g" /default.npmrc
perl -pi -w -e "s{ORGANIZATION}{$3}g" /default.npmrc
perl -pi -w -e "s{FEED}{$4}g" /default.npmrc
perl -pi -e "s/ANY_VALUE_BUT_NOT_AN_EMPTY_STRING/$5/g" /default.npmrc
perl -pi -e "s/BASE64_ENCODED_PERSONAL_ACCESS_TOKEN/$6/g" /default.npmrc

mv /default.npmrc $HOME/.npmrc

if [ "$1" ] && [ "$1" != "." ]; then
  echo "Moving to $1"
  cd $1
fi

npm publish