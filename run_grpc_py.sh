#!/bin/bash
set -evx
# trap 'kill $(jobs -p)' EXIT

pushd $TRAVIS_BUILD_DIR/examples/python/helloworld
python -m grpc_tools.protoc -I../../protos --python_out=. --grpc_python_out=. ../../protos/helloworld.proto
python greeter_server.py &
sleep 1
python greeter_client.py
popd

jobs -p | xargs kill

echo "Done!"
