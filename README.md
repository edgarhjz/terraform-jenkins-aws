# Deploying a Jenkins server in AWS
This configuration has been created to deploy a Jenkins server in Amazon Web Services using Terraform (Hashicorp).

#### How to install Terraform
To install Terraform you can find the instructions in the main site:
https://developer.hashicorp.com/terraform/install

#### Requirements
- AWS CLI (https://docs.aws.amazon.com/cli/v1/userguide/cli-chap-install.html).
- Configure AWS CLI credentials (https://docs.aws.amazon.com/cli/v1/userguide/cli-configure-files.html).

You can edit the default values for "aws_region", "ami_id" and instance_type in the variables.tf to fit your requirements, also create a file called terraform.tfvars with the values you want to use.
