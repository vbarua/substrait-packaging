#!/bin/sh
set -eu

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <package> <version>"
  exit 1
fi

PACKAGE="$1"
VERSION="$2"

# Strip leading 'v' from version if present
VERSION="${VERSION#v}"

# Retrieve a list of versions for the given $PACKAGE
RESPONSE=$(curl --fail --silent --header 'Accept: application/vnd.pypi.simple.v1+json' https://pypi.org/simple/$PACKAGE/)

# Check if the list of versions includes the given $VERSION
if echo "$RESPONSE" | jq --raw-output '.versions[]' | grep -Fx "$VERSION" > /dev/null; then
  echo true
else
  echo false
fi
