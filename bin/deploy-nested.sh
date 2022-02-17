#!/bin/bash -x
STACK_NAME=$(basename $(pwd))
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
REGION=ap-northeast-1

aws cloudformation package \
    --template-file ${STACK_NAME}.yaml \
    --s3-bucket rain-artifacts-${ACCOUNT_ID}-${REGION}
    --s3-prefix ${STACK_NAME} \
    --output-template-file response.yaml
aws cloudformation deploy \
    --template-file ./response.yaml \
    --stack-name ${STACK_NAME} \
    --capabilities CAPABILITY_NAMED_IAM