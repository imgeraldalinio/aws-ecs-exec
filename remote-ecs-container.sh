#!/bin/sh

CLUSTER_NAME=$1
SERVICE_NAME=$CLUSTER_NAME
REGION=us-east-1
AWS_PROFILE=$2
PROFILE="${AWS_PROFILE:-default}"  # If variable not set or null, use default.

if ! grep -rw "$PROFILE" ~/.aws/ > /dev/null 2>&1; then
  echo "AWS_PROFILE not found"
  exit 1
fi

TASK_ARN=$(
    aws ecs list-tasks \
        --cluster $CLUSTER_NAME \
        --service $SERVICE_NAME \
        --region $REGION \
        --output text \
        --query 'taskArns[0]' \
        --profile $PROFILE
        )

aws ecs execute-command \
    --cluster $CLUSTER_NAME \
    --region $REGION \
    --task $TASK_ARN \
    --container $CLUSTER_NAME \
    --command "sh" \
    --interactive  \
    --profile $PROFILE
