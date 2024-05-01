#!/bin/bash
set -e

INVENTORY="Lab-Inventory"
PROJECT="Apache playbooks"
PROJECT2="Additional playbooks"
TEMPLATE="Install Apache"
TEMPLATE3="Set motd"
TEMPLATE2="Extended services"
TEMPLATE_SURVEY="Install Apache with Survey"
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

# Check $TEMPLATE_SURVEY exists.
if [ !$CMD --tags=check-jt_survey -vv ]; then
 echo "FAIL: ${TEMPLATE_SURVEY} template not found or something is wrong. Please try again."
 exit 1
fi

