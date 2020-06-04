#!/bin/bash

echo "adding controller public key to authorized keys at $KEY_DRIVE/controller_rsa.pub"
mkdir -p ~/.ssh && \
  cat "$KEY_DRIVE"/controller_rsa.pub >> ~/.ssh/authorized_keys

