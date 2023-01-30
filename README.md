# aws-ecs-exec
Compilation scripts to use in Amazon ECS Exec access. You can use this script for easier access in your ECS task container.

## Variables
The following arguments that required for ECS exec script.
```
CLUSTER_NAME=myclustername
AWS_PROFILE=myclustername (optional)
```

## To remote access on ECS container
Type the following command
```
./ecs-exec.sh myclustername
```

**Optional**: If you want to specify the AWS credentials profile 
```
./ecs-exec.sh myclustername myclustername
```

## ECS Exec Checker
To run the Exec checker, you need the following:
- Cluster Name
- ECS task id

```
./check-ecs-exec.sh myclustername 3c3d40fa783f495381239c1715284c00
```
