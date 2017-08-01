#!/bin/bash
set -evx
# trap 'kill $(jobs -p)' EXIT

pushd $TRAVIS_BUILD_DIR/examples/cpp/helloworld
make
./greeter_server &
sleep 1
./greeter_client
popd

jobs -p | xargs kill

echo "Done!"
