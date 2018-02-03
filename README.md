gitlab-config
===================

This role allows to manage Gitlab configuration using Ansible.

The role can create or update Gitlab Config variable value

Inspired from gitlab-ci-variables https://github.com/peay/ansible-gitlab-ci-variables

[![Build Status](https://travis-ci.org/pli01/ansible-gitlab-config.svg?branch=master)](https://travis-ci.org/pli01/ansible-gitlab-config)

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
gitlab_api_url: https://some-url-to-gitlab.com/api/v4
```

Gitlab Config variables can be managed per project. The following example
manages variables for two projects.

```yaml
# Variables to manage for each Gitlab project
gitlab_ci_variables:
  - name: "group/project"
    kind: "project"
    variables:
      - key: VARIABLE_1
        value: value

By default, the role will also check for Gitlab CI variables that
are unknown (i.e., not specified in `gitlab_ci_variables`). This
can be disabled using

```yaml
# When enabled, check for unknown variables in Gitlab
# not managed by this role
gitlab_ci_check_unknown: false
```

This is purely a check. The role will not remove existing variables
that are unknown.
