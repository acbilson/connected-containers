#!/bin/bash

# generates an ssh key on controller and shares with client
mkdir -p ~/.ssh && \
ssh-keygen -t rsa -f ~/.ssh/controller_rsa -P "" && \
cp -f ~/.ssh/controller_rsa.pub "$KEY_DRIVE"
