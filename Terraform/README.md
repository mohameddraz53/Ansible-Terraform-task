# Terraform AWS Infrastructure Project

## Overview

This project provisions a complete AWS infrastructure using Terraform, including:

- IAM (Users, Group, Role, Policies)
- VPC (Networking)
- EKS Cluster (Kubernetes)
- EC2 Instance (Bastion Host)

All resources are modularized for scalability and reusability.

---

## Architecture

- IAM Group: `devops`
- IAM Users: `user1`, `user2`
- IAM Role: `eks-access-role`
- VPC with public subnet
- EKS Cluster with access entry for IAM Role
- EC2 instance to access the cluster

---

## Project Structure

```
project/
│
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
│
├── modules/
│   ├── vpc/
│   ├── eks/
│   └── ec2/
│
└── iam/
    └── iam.tf
```

---

## ⚙️ Prerequisites

- Terraform installed
- AWS CLI configured
- IAM user with sufficient permissions

---

## Setup Instructions

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Validate Configuration

```bash
terraform validate
```

### 3. Plan Infrastructure

```bash
terraform plan
```

### 4. Apply Changes

```bash
terraform apply
```

---

## 📤 Outputs

After successful deployment, Terraform will output:

- EC2 Public IP (used for Ansible access)

Example:

```
ec2_public_ip = 3.x.x.x
```

---

## IAM Configuration

- Created IAM group: `devops`
- Added users: `user1`, `user2`
- Created IAM role for EKS access
- Attached policy to both role and group

---

## EKS Configuration

- EKS Cluster deployed via module
- Node group created
- IAM Role added to access entry

---

## EC2 Configuration

- Amazon Linux instance
- Security group allows:
  - SSH (22)
  - HTTP (80)

- Used as bastion host to access EKS

---

## Modules

### VPC Module

- Creates VPC, subnet, IGW, route table

### EKS Module

- Creates EKS cluster and node group
- Adds IAM access entry

### EC2 Module

- Creates EC2 instance with security group

---

### S3 Module

- To stote terraform.tfstate file
- Implement remote backend (S3 + DynamoDB)

---

## Notes

- Ensure your AWS credentials are configured properly
- Make sure your key pair exists before deployment
- Update region if needed

---

## Cleanup

To destroy all resources:

```bash
terraform destroy
```

## Author

Mohamed Draz
