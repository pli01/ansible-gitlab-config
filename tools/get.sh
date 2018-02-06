#!/bin/bash

gitlab_token="${GITLAB_TOKEN}"
gitlab_api_url=${GITLAB_HOST}/api/v4

#api=users
api=${1:-application/settings}
# GET
curl -sSfL --header "PRIVATE-TOKEN: $gitlab_token" $gitlab_api_url/$api 
#| python -mjson.tool

# PUT 200 OK
#curl --request PUT -IsSfL --header "PRIVATE-TOKEN: $gitlab_token" "$gitlab_api_url/application/settings?signup_enabled=false&default_project_visibility=internal" 
# PUT 400 FAIL ERROR
#curl --request PUT -IL --header "PRIVATE-TOKEN: $gitlab_token" "$gitlab_api_url/application/settings?signup_enabled=true" 
#| python -mjson.tool

#curl --request PUT -sSfL --header "PRIVATE-TOKEN: $gitlab_token"  \
# -H "Content-Type: application/json" \
# -d '{}' \
#"$gitlab_api_url/application/settings" 
##| python -mjson.tool
# -d '{"signup_enabled":"false", "signin_enabled":"true", "default_project_visibility": "internal"}' \

#curl -sSfL --header "PRIVATE-TOKEN: $gitlab_token" $gitlab_api_url/application/settings | python -mjson.tool
