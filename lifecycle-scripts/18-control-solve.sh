#!/bin/bash
## solve-jt_survey
export CONTROLLER_HOST=localhost
export CONTROLLER_USERNAME=admin
export CONTROLLER_PASSWORD='ansible123!'
export CONTROLLER_VERIFY_SSL=false

cd /home/rhel/ansible-files

## download json
/usr/bin/curl https://raw.githubusercontent.com/leogallego/instruqt-wyfp/main/files/apache_survey.json -o /home/rhel/ansible-files/apache_survey.json


mkdir /tmp/files
cp /home/rhel/ansible-files/apache_survey.json /tmp/files


## run tasks from setup plabyook
/bin/ansible-playbook /tmp/controller-101-setup.yml --tags solve-jt_survey
