#!/bin/bash -x
STACK_NAME=$(basename $(pwd))
aws cloudformation package \
    --template-file ${STACK_NAME}Root.yaml \
    --s3-bucket tencho-lab-cfn-package \
    --s3-prefix ${STACK_NAME} \
    --output-template-file response.yaml
aws cloudformation deploy \
    --template-file ./response.yaml \
    --stack-name ${STACK_NAME} \
    --capabilities CAPABILITY_NAMED_IAM