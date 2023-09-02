#!/bin/bash

# Validate input parameters
if [ $# -lt 1 ]; then
  echo "Usage: $0 <CLUSTER_NAME> [SERVICE_NAME] [AWS_PROFILE]"
  exit 1
fi

CLUSTER_NAME="$1"
SERVICE_NAME="${2:-$CLUSTER_NAME}"
REGION="us-east-1"
AWS_PROFILE="${3:-default}"  # If variable not set or null, use default.

# Check if the AWS_PROFILE exists in the AWS configuration
if ! aws configure list-profiles | grep -q "^$AWS_PROFILE$"; then
  echo "AWS_PROFILE '$AWS_PROFILE' not found in your AWS configuration."
  exit 1
fi

# Get the task ARN
TASK_ARN=$(aws ecs list-tasks \
  --cluster "$CLUSTER_NAME" \
  --service "$SERVICE_NAME" \
  --region "$REGION" \
  --output text \
  --query 'taskArns[0]' \
  --profile "$AWS_PROFILE")

# Execute the command on the ECS task
aws ecs execute-command \
  --cluster "$CLUSTER_NAME" \
  --region "$REGION" \
  --task "$TASK_ARN" \
  --container "$CLUSTER_NAME" \
  --command "sh" \
  --interactive \
  --profile "$AWS_PROFILE"
