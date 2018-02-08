#!/bin/bash
#
# testing script:
#  source your variables before executing
#
set -e
(
cd $(dirname $0)/..

echo "# ansible-lint"
find tasks/ -type f -name "*.yml" -exec ansible-lint {} \;

echo "# ansible check"
ANSIBLE_ROLES_PATH=$(pwd)/.. ansible-playbook \
    -i tests/hostfile \
    -e "role_name=ansible-gitlab-config" \
    -e "gitlab_host=$GITLAB_HOST" \
    -e "gitlab_user=$GITLAB_USER" \
    -e "gitlab_password=$GITLAB_PASSWORD" \
    -e "gitlab_token=$GITLAB_TOKEN" \
    tests/gitlab-config.yml -v --syntax-check && \
ANSIBLE_ROLES_PATH=$(pwd)/.. ansible-playbook \
    -i tests/hostfile \
    -e "role_name=ansible-gitlab-config" \
    -e "gitlab_host=$GITLAB_HOST" \
    -e "gitlab_user=$GITLAB_USER" \
    -e "gitlab_password=$GITLAB_PASSWORD" \
    -e "gitlab_token=$GITLAB_TOKEN" \
    tests/gitlab-config.yml -v --list-tasks && \
ANSIBLE_ROLES_PATH=$(pwd)/.. ansible-playbook \
    -i tests/hostfile \
    -e "role_name=ansible-gitlab-config" \
    -e "gitlab_host=$GITLAB_HOST" \
    -e "gitlab_user=$GITLAB_USER" \
    -e "gitlab_password=$GITLAB_PASSWORD" \
    -e "gitlab_token=$GITLAB_TOKEN" \
    tests/gitlab-config.yml -vv
)
