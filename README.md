gitlab-config
===================

This role allows to manage Gitlab configuration via API using Ansible.
The role update Gitlab application settings
(https://docs.gitlab.com/ce/api/settings.html)

Inspired from gitlab-ci-variables https://github.com/peay/ansible-gitlab-ci-variables

[![Build Status](https://travis-ci.org/pli01/ansible-gitlab-config.svg?branch=master)](https://travis-ci.org/pli01/ansible-gitlab-config)
[![Ansible Galaxy](https://img.shields.io/badge/ansible-pli01.gitlab--config-blue.svg)](https://galaxy.ansible.com/pli01/gitlab-config/)

Requirements
------------

Gitlab with v4 API (Gitlab 9.0+).

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
# API token for Gitlab
gitlab_token: "XXXXXXXXXXXXXXXXXXXX"

# API URL for Gitlab
gitlab_api_url: https://some-url-to-gitlab/api/v4
```

Gitlab Config variables can be managed per project. The following example
manages variables for two projects.

```yaml
# Variables to manage Gitlab settings
gitlab_application_settings:
  signup_enabled: true
...
#

```yaml

