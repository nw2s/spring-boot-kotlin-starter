
export PY="import json; import sys; a=json.load(sys.stdin); print(a['Credentials']['AccessKeyId'] + ' ' + a['Credentials']['SecretAccessKey'] + ' ' + a['Credentials']['SessionToken'])"

export CREDS=$(aws sts assume-role --role-arn arn:aws:iam::688789537087:role/OrganizationAccountAccessRole --role-session-name AWSCLI-Session)

export CREDVALS=( $( echo $CREDS | python -c "${PY}" ) )

export AWS_ACCESS_KEY_ID=${CREDVALS[0]}
export AWS_SECRET_ACCESS_KEY=${CREDVALS[1]}
export AWS_SESSION_TOKEN=${CREDVALS[2]}

aws ecs register-task-definition --cli-input-json file://`pwd`/task.json

