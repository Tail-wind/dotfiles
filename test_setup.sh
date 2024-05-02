#!/bin/sh
docker build -t ubuntu-test --target=ubuntu-test .
docker run -dit -v "$(pwd)"/var/log:/usr/var/log ubuntu-test
