#!/bin/bash

# removes password access on client machine so that only an ssh key is allowed. requires root access
sed -i 's/#PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config

