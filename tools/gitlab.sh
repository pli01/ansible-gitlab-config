#!/bin/bash
#
# testing script:
#  source your variables before executing
#

cd $(dirname $0)/..
ANSIBLE_ROLES_PATH=$(pwd)/.. ansible-playbook \
    -i tests/hostfile \
    -e "role_name=ansible-gitlab-config" \
    -e "gitlab_host=$GITLAB_HOST" \
    -e "gitlab_token=$GITLAB_TOKEN" \
    tests/gitlab-config.yml -vv
