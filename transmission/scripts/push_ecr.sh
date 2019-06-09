#!/bin/bash
cd `dirname $0`

eval "$(cat ../../.env <(echo) <(declare -x))"

$(aws ecr get-login --no-include-email --region ap-northeast-1)
docker build -t transmission-project ../
docker tag transmission-project:latest ${ECR_END_POINT}/transmission-project:latest
docker push ${ECR_END_POINT}/transmission-project:latest
