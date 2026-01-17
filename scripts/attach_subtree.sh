#!/bin/sh
set -eu

# Check that SUBSTRAIT_VERSION is set
if [ -z "$SUBSTRAIT_VERSION" ]; then
  echo "Error: SUBSTRAIT_VERSION environment variable is not set"
  exit 1
fi

# Add substrait repository as a subtree
git subtree add --prefix=substrait https://github.com/substrait-io/substrait.git "$SUBSTRAIT_VERSION" --squash
