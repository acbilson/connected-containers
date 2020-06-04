#!/bin/bash

# adds client machine to controllers's known hosts, otherwise user input is required
ssh-keyscan -t rsa "$CLIENT_NAME" >> ~/.ssh/known_hosts
