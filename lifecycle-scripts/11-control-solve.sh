#!/bin/bash
## solve-inventory
export CONTROLLER_HOST=localhost
export CONTROLLER_USERNAME=admin
export CONTROLLER_PASSWORD='ansible123!'
export CONTROLLER_VERIFY_SSL=false


## run inventory tasks from setup plabyook
/bin/ansible-playbook /tmp/controller-101-setup.yml --tags solve-inventory-all
