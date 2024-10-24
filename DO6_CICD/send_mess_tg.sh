#!/bin/bash

Path=https://api.telegram.org/`cat ~/bot_token`/sendMessage
user_id=`cat ~/user_id`

text="Project: $CI_PROJECT_NAME
Stage: $CI_JOB_STAGE
Job name: $CI_JOB_NAME
Status: $CI_JOB_STATUS"

curl -d "chat_id=$user_id\&text=$text" $Path >/dev/null 2>&1
