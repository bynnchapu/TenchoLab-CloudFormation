#/bin/bash -x
aws cloudformation deploy \
    --stack-name "$1" \
    --template-file "$1.yaml" \
    ${@:2}