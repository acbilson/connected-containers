#!/bin/sh
# runs a series of setup scripts in the correct order to securely connect controller with clients

# loads env variables
. ./.env

echo "making controller key drive owner"
echo "--------------------------------"
docker exec --user root "$CONTROLLER_NAME" /bin/bash -c "chown controller $KEY_DRIVE"

echo "\ngenerating ssh key in controller"
echo "--------------------------------"
docker exec "$CONTROLLER_NAME" /bin/bash -c "$SCRIPT_DRIVE/generate-key.sh"

echo "\nadding controller public key to client"
echo "--------------------------------------"
docker exec "$CLIENT_NAME" /bin/bash -c "$SCRIPT_DRIVE/add-controller-key.sh"

echo "\nstarting ssh service in client"
echo "------------------------------"
docker exec --user root "$CLIENT_NAME" /bin/bash -c "$SCRIPT_DRIVE/start-ssh-service.sh"

echo "\nremoving password access to client"
echo "------------------------------"
docker exec --user root "$CLIENT_NAME" /bin/bash -c "$SCRIPT_DRIVE/rm-password-access.sh"

echo "\nadding client host to controller"
echo "--------------------------------"
docker exec "$CONTROLLER_NAME" /bin/bash -c "$SCRIPT_DRIVE/add-client-to-hosts.sh"

echo "\nChecks that scripts worked by asking identity via controller ssh to client"
echo "--------------------------------------------------------------------------"
docker exec "$CONTROLLER_NAME" /bin/bash -c "$SCRIPT_DRIVE/check-ssh.sh"
