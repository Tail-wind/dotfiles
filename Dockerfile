# syntax=docker/dockerfile:1
FROM ubuntu:latest AS ubuntu
COPY setup.sh setup.sh
RUN setup.sh &> /var/log/ubuntu_test.log

FROM scratch AS test-install
COPY --from=ubuntu /var/log/ubuntu_test.log /
