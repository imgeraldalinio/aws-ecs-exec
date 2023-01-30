# aws-ecs-exec
Compilation scripts to use in Amazon ECS Exec access. You can use this script for easier access in your ECS task container.

## Variables
The following arguments that required for ECS exec script.
```
CLUSTER_NAME=qa-helloworld
AWS_PROFILE=helloworld (optional)
```

## To remote access on ECS container
Type the following command
```
./ecs-exec.sh qa-helloworld
```

**Optional**: If you want to specify the AWS credentials profile 
```
./ecs-exec.sh qa-helloworld helloworld
