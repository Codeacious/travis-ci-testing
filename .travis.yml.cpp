language: cpp
cache: ccache
branches:
  only:
    - "master"
notifications:
  email: false
sudo: true
dist: trusty
before-install:
  - sudo apt-get -qq update
  - sudo apt-get install -y autoconf automake libtool curl make g++ unzip
  - sudo apt-get install -y build-essential autoconf libtool
  - sudo apt-get install -y libgflags-dev libgtest-dev
  - sudo apt-get install -y clang libc++-dev
  - sudo apt-get install -y ccache
install:
    - ./link_ccache.sh
    - ./install_grpc.sh
script: ./run_grpc_cpp.sh