#!/bin/bash
set -e

INVENTORY="Lab-Inventory"
HOSTS=(node1 node2)
GROUP="web"

#Ansible settings
export ANSIBLE_STDOUT_CALLBACK="community.general.yaml"
export CONTROLLER_HOST=localhost
export CONTROLLER_USERNAME=admin
export CONTROLLER_PASSWORD='ansible123!'
export CONTROLLER_VERIFY_SSL=false

# Playbook run command
CMD="/bin/ansible-playbook /tmp/controller-101-setup.yml"

##Check $INVENTORY exists.
if ! $CMD --tags=check-inventory -vv; then
 echo "FAIL: ${INVENTORY} inventory not found. Remember it's case-sensitive! Please try again."
 exit 1
fi


# Check hosts are in $INVENTORY
for host in "${HOSTS[@]}"; do
  if  ! $CMD --tags=check-inv-hosts -vv; then
     echo "FAIL: node1 or node2 are missing from ${INVENTORY} or there is a duplicate host in another inventory. If so, please remove the duplicate ${host} host and check again. Remember it's case-sensititve!"
     exit 1
  fi
done


# Check $GROUP is in $INVENTORY
if ! $CMD --tags=check-inv-group -vv; then
    echo "FAIL: ${GROUP} group is missing, node1 and node2 are not in the group, or there is a duplicate ${GROUP} group in another inventory. If so, please remove the duplicate ${GROUP} group and check again. Remember it's case-sensititve!"
    echo "Remember it's case-sensititve! Please try again."
    exit 1
fi

