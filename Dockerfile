# syntax=docker/dockerfile:1
FROM ubuntu:latest AS ubuntu-test
COPY setup.sh setup.sh
RUN apt-get update && apt-get install sudo -y
RUN ./setup.sh > /var/log/ubuntu_test.log 2>&1

FROM alpine:latest AS alpine-test
COPY setup.sh setup.sh
RUN ./setup.sh > /var/log/alpine_test.log 2>&1

FROM amazonlinux:latest AS amzlinux-test
COPY setup.sh setup.sh
RUN ./setup.sh > /var/log/amzlinux_test.log 2>&1

FROM redhat/ubi8:latest AS redhat-test
COPY setup.sh setup.sh
RUN yum install sudo -y
RUN ./setup.sh > /var/log/redhat_test.log 2>&1

FROM archlinux:latest AS arch-test
COPY setup.sh setup.sh
RUN ./setup.sh > /var/log/arch_test.log 2>&1

FROM scratch AS test-install
COPY --from=ubuntu-test /var/log/ubuntu_test.log /var/log/ubuntu_test.log
COPY --from=alpine-test /var/log/alpine_test.log /var/log/alpine_test.log
COPY --from=amzlinux-test /var/log/amzlinux_test.log /var/log/amzlinux_test.log
COPY --from=redhat-test /var/log/redhat_test.log /var/log/redhat_test.log
COPY --from=arch-test /var/log/arch_test.log /var/log/arch_test.log
