#!/usr/bin/env sh
set -evx
trap 'kill $(jobs -p)' EXIT

pushd examples/python/helloworld
python -m grpc_tools.protoc -I../../protos --python_out=. --grpc_python_out=. ../../protos/helloworld.proto
python greeter_server.py &
python greeter_client.py
popd
