# Ansible Configuration for EKS Deployment

## Overview

This project uses Ansible to configure an EC2 instance and deploy applications to an EKS cluster.

Main tasks:

- Connect to EC2 instance
- Configure Kubernetes access (kubeconfig)
- Deploy application (Deployment + Service)

---

## Project Structure

```
ansible/
│
├── inventory.ini
├── playbook.yml
└── k8s/
    ├── deployment.yaml
    └── service.yaml
```

---

## Prerequisites

- Ansible installed
- SSH key (.pem file)
- EC2 instance running
- AWS CLI configured on EC2
- IAM role attached to EC2 with EKS access

---

## Inventory Configuration

Update `inventory.ini` with your EC2 public IP:

```
[ec2]
<EC2_PUBLIC_IP> ansible_user=ec2-user ansible_ssh_private_key_file=key.pem
```

---

## Playbook Execution

Run the playbook:

```bash
ansible-playbook -i inventory.ini playbook.yml
```

---

## What the Playbook Does

### 1. Install kubectl

Installs Kubernetes CLI on EC2 instance.

### 2. Configure kubeconfig

Uses AWS CLI to connect EC2 to EKS cluster:

```bash
aws eks update-kubeconfig --region <region> --name <cluster-name>
```

### 3. Copy Kubernetes Files

- Deployment YAML
- Service YAML

### 4. Deploy Application

Applies Kubernetes resources using kubectl.

---

## Kubernetes Resources

### Deployment

- Nginx container
- 2 replicas

### Service

- Type: LoadBalancer
- Exposes application externally

---

## Access Application

After deployment:

1. Get service external IP:

```bash
kubectl get svc
```

2. Open in browser:

```
http://<EXTERNAL-IP>
```

---

## Notes

- Ensure Security Group allows SSH access
- Ensure EC2 IAM role has EKS permissions
- Wait a few minutes for LoadBalancer to be provisioned

---

## Troubleshooting

### Cannot connect via SSH

- Check security group (port 22)
- Verify key permissions

### kubectl not working

- Verify kubeconfig setup
- Check IAM role permissions

### LoadBalancer pending

- Wait for AWS provisioning
- Check subnet configuration

---

## Future Improvements

- Use Ansible roles
- Automate kubectl installation via script
- Add Helm support
- CI/CD integration

---

## Author

Mohamed Draz
