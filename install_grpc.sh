#!/bin/bash
set -ex

# Install protobuf
pushd $TRAVIS_BUILD_DIR/..
git clone https://github.com/google/protobuf.git

pushd protobuf
./autogen.sh
./configure --prefix=/usr
make && make check && sudo make install && sudo ldconfig
popd

popd

# Install grpc
pushd $TRAVIS_BUILD_DIR/..
git clone -b $(curl -L https://grpc.io/release) https://github.com/grpc/grpc

pushd grpc
git submodule update --init
make && sudo make install
popd

popd
