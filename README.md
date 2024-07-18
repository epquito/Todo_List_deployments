# Todo_List_deployments

Within this repository, there are multiple branches showcasing different ways to deploy the web application "todolist" and test it using various automation, containerization, and CI/CD development tools.

![Alt Text](https://github.com/epquito/Todo_List_deployments/blob/master/Ansible-aws.png)

## Prerequisites

Before deploying the Flask application "TodoList," ensure you have the following and have a brief understanding of AWS resources:
- AWS account
- VSCode
- Terraform
- Ansible

## Create a Simple Virtual Private Cloud with the Following Configurations

- **VPC**
  - Subnets
  - Internet Gateway
  - Route Table
  - Network Access Control List
  - Security Groups

## Create EC2 with Specific Ubuntu AMI that will Act as a Worker/Target Node

- **EC2**
  - AMI
  - Instance Type
  - Key File
  - Associate Subnet
  - Associate Security Group
  - Enable Public IP
  - Tags
  - Provisioner

## Create S3 to Store State Files

- **S3**
  - Bucket
  - Enable Versioning
  - Enable Server-Side Encryption

## Create Database for Flask Application

- **RDS**
  - Subnet Group ID
  - RDS Engine
  - RDS Version
  - Instance Class
  - Enable Public Access
  - Associate DB Subnet Group
  - Associate Security Group

## Create Table to Ensure Terraform State Files are Encrypted

- **DynamoDB**
  - Create Table
  - Disable Recovery

## Ansible YML Files

- Dynamic inventory
- Roles
- Vault
- Subdirectories inside roles (defaults, files, handlers, meta, tasks, templates, vars)

## Git clone Repository

```bash
git clone git@github.com:epquito/Todo_List_deployments.git

```

## Convert text files back to terraform/ansible

- Todolist-variables.txt > Todolist-variables.tf (add a default value for all the variables shown to match your deployment)
- aws_ec2.txt > aws_ec2.yml
- roles.txt > roles.yml
- 5_todolist_worker_node_role/vars/main.txt > 5_todolist_worker_node_role/vars/main.yml
- 5_todolist_worker_node_role/vars/vault.txt > 5_todolist_worker_node_role/vars/vault.yml( you have to create this via terminal inside the directory "vars") 

```bash
ansible-vault create <name of vault.yml> ## input password for vault yml
ansible-vault edit <name of vault.yml> ## to edit the file also have to input vault password every time

```

## Commands to Execute in Terminal once all Terraform and Ansible files are configured within your Operating System

Execute the following commands in the terminal:

```bash
terraform init
terraform plan
terraform apply
ansible-vault create vault.yml
ansible-playbook --ask-vault-pass role.yml -i aws_ec2.yml -u ubuntu --private-key=/path/to/pem/file
```
