#!/bin/bash

# adds a group and user with matching passwd
groupadd client && \
useradd -g client -s /bin/bash -m client && \
echo -e "client\nclient" | passwd client
