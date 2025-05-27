#!/bin/bash

dnf update -y
dnf install -y memcached

# Allow external connections
sed -i 's/127.0.0.1/0.0.0.0/g' /etc/sysconfig/memcached

# Start and enable service
systemctl enable memcached
systemctl restart memcached