# syntax=docker/dockerfile:1
FROM ubuntu:latest AS ubuntu-test
WORKDIR /usr
COPY setup.sh setup.sh
RUN apt-get update && apt-get install sudo -y
ENTRYPOINT ./setup.sh > ./var/log/ubuntu_test.log 2>&1

FROM alpine:latest AS alpine-test
COPY setup.sh setup.sh
ENTRYPOINT ./setup.sh > ./var/log/alpine_test.log 2>&1

FROM amazonlinux:latest AS amzlinux-test
COPY setup.sh setup.sh
ENTRYPOINT ./setup.sh > ./var/log/amzlinux_test.log 2>&1

FROM redhat/ubi8:latest AS redhat-test
COPY setup.sh setup.sh
RUN yum install sudo -y
ENTRYPOINT ./setup.sh > ./var/log/redhat_test.log 2>&1

FROM archlinux:latest AS arch-test
COPY setup.sh setup.sh
ENTRYPOINT ./setup.sh > ./var/log/arch_test.log 2>&1
