#!/bin/bash

set -eux

sudo apt-get update

# DON'T DO THIS EXCPET TEST ENVIRONMNET: Copy authorized ssh key to root user
cp /home/admin/.ssh/authorized_keys /root/.ssh/authorized_keys
