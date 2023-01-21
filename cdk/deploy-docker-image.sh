
export PY="import json; import sys; a=json.load(sys.stdin); print(a['Credentials']['AccessKeyId'] + ' ' + a['Credentials']['SecretAccessKey'] + ' ' + a['Credentials']['SessionToken'])"

export CREDS=$(aws sts assume-role --role-arn arn:aws:iam::688789537087:role/OrganizationAccountAccessRole --role-session-name AWSCLI-Session)

export CREDVALS=( $( echo $CREDS | python -c "${PY}" ) )

export AWS_ACCESS_KEY_ID=${CREDVALS[0]}
export AWS_SECRET_ACCESS_KEY=${CREDVALS[1]}
export AWS_SESSION_TOKEN=${CREDVALS[2]}

echo AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
echo AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
echo AWS_SESSION_TOKEN=${AWS_SESSION_TOKEN}

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 688789537087.dkr.ecr.us-east-1.amazonaws.com

docker tag d1fd6caf9b8f 688789537087.dkr.ecr.us-east-1.amazonaws.com/sbk-repository:latest

docker push 688789537087.dkr.ecr.us-east-1.amazonaws.com/sbk-repository:latest