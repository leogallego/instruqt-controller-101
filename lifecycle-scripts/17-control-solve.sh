#!/bin/bash
## solve-workflow
export CONTROLLER_HOST=localhost
export CONTROLLER_USERNAME=admin
export CONTROLLER_PASSWORD='ansible123!'
export CONTROLLER_VERIFY_SSL=false

#/bin/ansible-galaxy collection install awx.awx:==24.2.0
#/bin/ansible-galaxy collection list awx.awx
/bin/ansible-playbook /tmp/controller-101-setup.yml --tags solve-workflow

### su - rhel user

#su - rhel -c 'export CONTROLLER_HOST=localhost'
#su - rhel -c 'export CONTROLLER_USERNAME=admin'
#su - rhel -c 'export CONTROLLER_PASSWORD='ansible123!''
#su - rhel -c 'export CONTROLLER_VERIFY_SSL=false' 
#
## run tasks from setup plabyook
#su - rhel -c '/bin/ansible-galaxy collection list awx.awx'
#su - rhel -c '/bin/ansible-galaxy collection list ansible.controller'
#su - rhel -c '/bin/ansible-galaxy collection install awx.awx:==24.2.0'
#su - rhel -c '/bin/ansible-galaxy collection list awx.awx'
#
#su - rhel -c '/bin/ansible-playbook /tmp/controller-101-setup.yml --tags solve-workflow'

## run tasks from setup plabyook with navigator and check awx.awx
#su - rhel -c '/bin/ansible-navigator collections -m stdout'
#su - rhel -c '/bin/ansible-navigator run /tmp/controller-101-setup.yml --tags solve-workflow -m stdout -vvv'
