#!/usr/bin/env bash

set -e

echo "Starting before script... caller identity is "
aws sts get-caller-identity
echo "assuming ${role}"
role=(`aws sts assume-role --role-arn "arn:aws:iam::${account}:role/${role}" --role-session-name "GITLAB-SESSION" --query '[Credentials.AccessKeyId,Credentials.SecretAccessKey,Credentials.SessionToken]' --output text`)
unset AWS_SECURITY_TOKEN
export AWS_DEFAULT_REGION="us-east-1"
export AWS_ACCESS_KEY_ID=${role[0]}
export AWS_SECRET_ACCESS_KEY=${role[1]}
export AWS_SESSION_TOKEN=${role[2]}
echo "ending before script... caller identity is "
aws sts get-caller-identity
. ./prepare_env.sh
export PATH=$PATH:/builds/cie/cie-iaac/example-terraform-ec2/plugins
cd /builds/cie/cie-iaac/example-terraform-ec2