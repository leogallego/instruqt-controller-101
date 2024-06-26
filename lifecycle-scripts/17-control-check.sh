#!/bin/bash
set -e

INVENTORY="Lab-Inventory"
PROJECT="Apache playbooks"
PROJECT2="Additional playbooks"
TEMPLATE="Install Apache"
TEMPLATE2="Set motd"
TEMPLATE3="Extended services"
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
su - rhel -c '/bin/ansible-galaxy collection install awx.awx:==24.2.0'

CMD="/bin/ansible-playbook /tmp/controller-101-setup.yml"

# Check $WORKFLOW exists.
if ! $CMD --tags=check-workflow-only -vvv; then
 echo "FAIL: ${WORKFLOW} not found or something is wrong with it. Review the tasks and try again please."
 exit 1
fi


