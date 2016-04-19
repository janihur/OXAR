#!/bin/bash

# install ansible on guest
# install only a specific version so that updates don't break the provisioning scripts
# supports only: oracle linux 7 and centos 7
# https://fedoraproject.org/wiki/EPEL

# TODO: check rpm/yum exit codes

command -v ansible > /dev/null

if (($? == 1))
then
    # 1. install epel repository
    # TODO: hardcoded epel version
    if [ -f /etc/oracle-release ]
    then # oracle
        rpm -Uvh http://download.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-6.noarch.rpm
    elif [ -f /etc/centos-release ]
    then # centos
        yum install -y epel-release-7-5
        if (($?))
        then
            >&2 echo "Error: epel installation failed"
            exit 1
        fi
    else
        >&2 echo "Error: unsupported linux distribution"
        exit 1
    fi
    # 2. install ansible
    yum install -y ansible1.9-${1}-2.el7
    if (($?))
    then
        >&2 echo "Error: ansible installation failed"
        exit 1
    fi
fi

exit 0
