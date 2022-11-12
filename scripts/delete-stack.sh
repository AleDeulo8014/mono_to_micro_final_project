#! /bin/bash

# $1 => stack name defined
# $2 => Profile to use
aws cloudformation delete-stack --stack-name $1 --profile=$2
