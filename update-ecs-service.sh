#!/bin/bash

# Usage: ./ecs-update.sh <CLUSTER_NAME> [SERVICE_NAME] [AWS_PROFILE]

# Validate input parameters
if [ $# -lt 1 ]; then
  echo "Usage: $0 <CLUSTER_NAME> [SERVICE_NAME] [AWS_PROFILE]"
  exit 1
fi

CLUSTER_NAME="$1"
SERVICE_NAME="${2:-$CLUSTER_NAME}"
REGION="us-east-1"
AWS_PROFILE="${3:-default}"

# Check if the AWS_PROFILE exists in the AWS configuration
if ! aws configure list-profiles | grep -q "^$AWS_PROFILE$"; then
  echo "AWS_PROFILE '$AWS_PROFILE' not found in your AWS configuration."
  exit 1
fi

# Enable ECS Exec command and force a new deployment
aws ecs update-service \
  --cluster "$CLUSTER_NAME" \
  --service "$SERVICE_NAME" \
  --region "$REGION" \
  --enable-execute-command \
  --force-new-deployment \
  --profile "$AWS_PROFILE"

echo "ECS Exec command enabled for service '$SERVICE_NAME' in cluster '$CLUSTER_NAME'."
