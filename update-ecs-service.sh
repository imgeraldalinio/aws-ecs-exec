#!/bin/sh

# Run this script after enabling the ECS exec command: ./ecs-update.sh qa-helloworld
CLUSTER_NAME=$1
SERVICE_NAME=$CLUSTER_NAME
REGION=us-east-1
AWS_PROFILE=$2
PROFILE="${AWS_PROFILE:-default}"  # If variable not set or null, use default.

if ! grep -rw "$PROFILE" ~/.aws/ > /dev/null 2>&1; then
  echo "AWS_PROFILE not found"
  exit 1
fi

aws ecs update-service --cluster $CLUSTER_NAME --service $SERVICE_NAME --region $REGION --enable-execute-command --force-new-deployment --profile $PROFILE
