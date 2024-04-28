# syntax=docker/dockerfile:1
FROM ubuntu:latest AS ubuntu-test
COPY setup.sh setup.sh
RUN ./setup.sh > /var/log/ubuntu_test.log

FROM scratch AS test-install
COPY --from=ubuntu-test /var/log/ubuntu_test.log /var/log/ubuntu_test.log
