#!/bin/bash

# adds a group and user with matching passwd
groupadd controller && \
useradd -g controller -s /bin/bash -m controller && \
echo -e "controller\ncontroller" | passwd controller
