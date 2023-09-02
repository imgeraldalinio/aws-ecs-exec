# AWS ECS Exec Script

![AWS ECS Logo](https://cdn.icon-icons.com/icons2/2699/PNG/512/amazon_ecs_logo_icon_168661.png)

## Introduction

This project provides a convenient Bash script for enabling the AWS ECS Exec feature on Amazon Elastic Container Service (ECS). ECS Exec allows you to run interactive shell sessions within running containers, making debugging and troubleshooting tasks easier and more efficient.

**Note:** Before using this script, it is recommended to follow the tutorial on [LinuxBeast](https://linuxbeast.com/tutorials/aws/remote-the-aws-ecs-fargate-container/) for setting up AWS ECS Fargate containers and understanding the context in which this script is used.

## Usage

To use this script, follow the instructions below:

1. Clone this repository to your local environment and execute the script (`./ecs-exec-config-checker.sh`) to ensure that you meet the ECS Exec requirements.
2. To run the ECS Exec config checker, use the following command:
    ```
    ./ecs-exec-config-checker.sh <CLUSTER_NAME> [TASK ID]
    ```
   Ensure that you have the AWS Command Line Interface (CLI) installed and configured with the appropriate AWS IAM credentials.
3. Ensure you have the AWS Command Line Interface (CLI) installed and configured with the appropriate AWS IAM credentials.

4. Run the script with the following parameters:

    ```bash
    ./ecs-remote-session.sh <CLUSTER_NAME> [SERVICE_NAME] [AWS_PROFILE]
    ```
    - <CLUSTER_NAME>: The name of your ECS cluster.
    - [SERVICE_NAME] (optional): The name of the ECS service you want to enable ECS Exec for. If not provided, it defaults to <CLUSTER_NAME>.
    - [AWS_PROFILE] (optional): The AWS CLI profile to use for AWS authentication. If not provided, it defaults to the AWS default profile.

5. The script will enable the ECS Exec feature for the specified ECS service and force a new deployment.

6. You can now use the AWS CLI to run interactive shell sessions within your ECS containers. For example:

    ```bash
    ./ecs-force-update.sh <CLUSTER_NAME> [SERVICE_NAME] [AWS_PROFILE]
    ```

## Prerequisites

Before using this script, make sure you have the following prerequisites in place:

 - AWS CLI: Ensure you have the AWS Command Line Interface installed and configured with appropriate AWS credentials.

## Script Details

 The ecs-update.sh script performs the following actions:

 - Validates input parameters and provides usage information.
 - Checks for the existence of the specified AWS profile in your AWS configuration.
 - Enables the ECS Exec command for the specified ECS service.
 - Forces a new deployment to apply the changes.

## Troubleshooting

 If you encounter issues or have questions about using AWS ECS Exec, refer to the official AWS documentation or seek assistance from the AWS support community.

## Contributions

 Contributions to this script are welcome! If you have suggestions for improvements, encounter issues, or want to add new features, please open an issue or submit a pull request.

## License

 This script is licensed under the MIT License. See the [LICENSE](https://chat.openai.com/LICENSE) file for details.

## References

 - Amazon ECS Exec Documentation: [https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-exec.html](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-exec.html)
