language: python
cache: pip
branches:
  only:
    - "master"
notifications:
  email: false
python:
  - "2.7"
sudo: true
dist: trusty
install: pip install grpcio grpcio-tools
script: ./run_grpc_py.sh