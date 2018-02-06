gitlab-config
===================

This role allows to manage Gitlab configuration via API using Ansible.

The role manage Gitlab via /api/v4
 * application settings: (https://docs.gitlab.com/ce/api/settings.html)
 * users : (https://docs.gitlab.com/ce/api/users.html)
 * groups : (https://docs.gitlab.com/ce/api/groups.html)

Inspired from gitlab-ci-variables https://github.com/peay/ansible-gitlab-ci-variables

[![Build Status](https://travis-ci.org/pli01/ansible-gitlab-config.svg?branch=master)](https://travis-ci.org/pli01/ansible-gitlab-config)
[![Ansible Galaxy](https://img.shields.io/badge/ansible-pli01.gitlab--config-blue.svg)](https://galaxy.ansible.com/pli01/ansible-gitlab-config/)

Requirements
------------

Gitlab with v4 API (Gitlab 9.0+).
Tested on gitlab 10.4.2

Installation
-------------

```sh
ansible-galaxy install pli01.gitlab-config
```

Usage
-----

Variables are documented in [defaults/main.yml](defaults/main.yml).

API URL and token can be specified via
```yaml

# Gitlab URL
gitlab_host: 'https://some-url-to-gitlab'

# API token for Gitlab
gitlab_token: "XXXXXXXXXXXXXXXXXXXX"

# API URL for Gitlab
gitlab_api_url: "{{ gitlab_host }}/api/v4"

# if no API token, autmatically generate one with admin user/password 
# gitlab_user: "USER_ADMIN_PRIVILEGE"
# gitlab_password: "XXX"

```

The following example manages application settings (ex: signup_enable)
```yaml
# Variables to manage Gitlab settings (https://docs.gitlab.com/ce/api/settings.html)
gitlab_application_settings:
  signup_enabled: false
...
#
# Variable to manage users
#
gitlab_local_users:
  - username: test-user1
    name: "test user1"
    email: test-user1@test.com
    password: password01
    skip_confirmation: true
    reset_password: false
    can_create_group: false
...
#
# Variable to manage groups
#
gitlab_groups:
  - name: grp1
    path: grp1

```
