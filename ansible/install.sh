#!/bin/bash

# Install Ansible on guest
# Install only a specific version so that updates don't break the provisioning scripts.
# TODO: other distros too currently centos 7.2 only

yum install -y epel-release
# TODO: version hardcoded
yum install -y ansible-${1}-1.el7
# TODO: this is the wrong place, move to ansible playbook
# yum --exclude=ansible\* --exclude=kernel\* update -y
