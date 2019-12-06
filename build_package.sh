#!/bin/bash

VERSION=$(<VERSION)
echo "Using version $VERSION"
￼
PBR_VERSION=$VERSION python3 setup.py sdist bdist_wheel
￼
if [ -f "dist/faucet-$VERSION.tar.gz" ]; then
  echo Created package dist/faucet-$VERSION.tar.gz
  exit 0
fi

echo Packaged could not be created
exit 1
