#!/bin/bash

# confirms ssh key is properly configured
ssh -i ~/.ssh/controller_rsa client@"$CLIENT_NAME" whoami
