#!/bin/bash

# Install Ansible on guest
# Install only a specific version so that updates don't break the provisioning scripts.
# TODO: other distros too currently centos 7.2 only

command -v ansible > /dev/null

if (($? == 1))
then
    yum install -y epel-release
    # TODO: version hardcoded
    yum install -y ansible1.9-${1}.el7
    # TODO: this is the wrong place, move to ansible playbook
    # yum --exclude=ansible\* --exclude=kernel\* update -y
fi
