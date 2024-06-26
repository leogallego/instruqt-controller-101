#!/bin/bash
set -e

INVENTORY="lab-inventory"
PROJECT="Apache playbooks"
PROJECT2="Additional playbooks"
TEMPLATE_APACHE="Install Apache"
TEMPLATE_MOTD="Set motd"
TEMPLATE_EXT="Extended services"
WORKFLOW="Your first workflow"
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

# Check $TEMPLATE_EXT exists.
if ! $CMD --tags=check-template2 -vv; then
 echo "FAIL: ${TEMPLATE_EXT} template not found or something is missing. Please try again."
 exit 1
fi

# Check node3 exists.
if ! $CMD --tags=check-node3 -vv; then
 echo "FAIL: node3 host not found in Lab-Inventory or something is missing. Please try again."
 exit 1
fi

# Check database group exists.
if ! $CMD --tags=check-database -vv; then
 echo "FAIL: [database] group not found or node3 is missing from the group. Please try again."
 exit 1
fi

# Check $TEMPLATE_MOTD exists.
if ! $CMD --tags=check-template3 -vv; then
 echo "FAIL: ${TEMPLATE_MOTD} template not found or something is missing. Please try again."
 exit 1
fi

