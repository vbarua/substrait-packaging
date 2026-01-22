#!/bin/sh
set -eu

# Check that SUBSTRAIT_VERSION is set
if [ -z "$SUBSTRAIT_VERSION" ]; then
  echo "Error: SUBSTRAIT_VERSION environment variable is not set"
  exit 1
fi

# Check that SUBSTRAIT_VERSION matches the expected vx.y.z format
if ! echo "$SUBSTRAIT_VERSION" | grep -qE '^v[0-9]+\.[0-9]+\.[0-9]+$'; then
  echo "Error: SUBSTRAIT_VERSION must follow the format vx.y.z, received: $SUBSTRAIT_VERSION"
  exit 2
fi

# Add substrait repository as a subtree
git subtree add --prefix=substrait https://github.com/substrait-io/substrait.git "$SUBSTRAIT_VERSION" --squash
