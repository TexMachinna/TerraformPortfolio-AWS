# Terraform Enterprise Infrastructure Portfolio (AWS)

## Overview

This repository demonstrates the implementation of a modular Infrastructure as Code (IaC) project using **Terraform** and **Amazon Web Services (AWS)** following enterprise infrastructure design principles.

The project was designed to showcase modern Terraform development practices, including reusable modules, environment separation, remote state management, infrastructure composition, and operational monitoring while maintaining a cost-conscious architecture suitable for personal learning and portfolio development.

Rather than focusing solely on deploying AWS resources, this repository emphasizes infrastructure organization, maintainability, and reusability similar to what would be expected in a professional engineering environment.

---

# Architecture

```text
                               AWS Cloud

                                 Internet
                                     │
                             Internet Gateway
                                     │
                             ┌──────────────┐
                             │     VPC      │
                             └──────────────┘
                              │            │
                      Public Subnet   Private Subnet
                              │
                    Auto Scaling Group
                              │
                      Launch Template

                      CloudWatch Monitoring

Terraform Remote State
├── Amazon S3
└── DynamoDB State Locking
```

---

# Repository Structure

```text
terraform-cloud-infra-lab/

├── bootstrap/
│   └── remote-state/
│
├── modules/
│   ├── networking/
│   ├── security/
│   ├── compute/
│   └── monitoring/
│
├── environments/
│   ├── dev/
│   └── prod/
│
├── docs/
│
└── pipelines/
```

### Repository Layout

| Folder           | Purpose                                                                |
| ---------------- | ---------------------------------------------------------------------- |
| **bootstrap**    | Creates and manages the Terraform remote backend infrastructure.       |
| **modules**      | Reusable Terraform modules implementing each infrastructure component. |
| **environments** | Environment-specific deployments using the reusable modules.           |
| **docs**         | Project documentation and architecture diagrams.                       |
| **pipelines**    | CI/CD pipeline definitions (future implementation).                    |

---

# Implemented Features

* Modular Terraform architecture
* Reusable infrastructure modules
* Environment separation (Development / Production)
* Amazon S3 remote state
* DynamoDB state locking
* AWS VPC networking
* Public and Private subnets
* Internet Gateway
* Route Tables and Associations
* Security Groups
* Launch Templates
* Auto Scaling Groups
* CloudWatch Monitoring
* Infrastructure tagging
* Terraform outputs
* Module documentation

---

# Modules

## Networking

Responsible for provisioning the core AWS networking infrastructure.

Creates:

* VPC
* Public Subnet
* Private Subnet
* Internet Gateway
* Public Route Table
* Private Route Table
* Route Table Associations

---

## Security

Responsible for defining network access policies.

Creates:

* Security Groups
* Ingress Rules
* Egress Rules

---

## Compute

Responsible for deploying application compute resources.

Creates:

* Launch Template
* Auto Scaling Group

---

## Monitoring

Responsible for infrastructure monitoring.

Creates:

* Amazon CloudWatch Metric Alarms

---

# Environments

Two independent environments are implemented.

## Development

Intended for testing infrastructure changes before promoting them into production.

## Production

Represents a production deployment using the same reusable modules while maintaining independent configuration values.

This separation demonstrates Infrastructure as Code best practices by allowing changes to be validated safely before affecting production resources.

---

# Terraform Remote State

Terraform state is managed remotely using:

* Amazon S3
* DynamoDB State Locking

Keeping the backend separate from the environments allows development and production infrastructure to be safely destroyed without affecting Terraform state management.

---

# Deployment

Initialize Terraform:

```bash
terraform init -backend-config=backend.hcl
```

Preview infrastructure changes:

```bash
terraform plan
```

Deploy:

```bash
terraform apply
```

Destroy environment resources:

```bash
terraform destroy
```

> The bootstrap remote-state infrastructure is intended to remain deployed.

---

# Cost Considerations

This repository was intentionally designed to minimize AWS costs.

Examples include:

* Launching a single EC2 instance through an Auto Scaling Group.
* Omitting NAT Gateways to avoid hourly charges.
* Using Amazon S3 for remote state.
* Using DynamoDB On-Demand billing for state locking.
* Destroying development environments after testing.

---

# Lessons Learned

This project provided hands-on experience with:

* Terraform module design
* Infrastructure composition
* Remote state management
* AWS networking
* Security Group design
* Launch Templates
* Auto Scaling Groups
* CloudWatch monitoring
* Environment separation
* Infrastructure organization
* Reusable Infrastructure as Code

---

# Future Improvements

Planned enhancements include:

* Application Load Balancer
* Multi-AZ Auto Scaling deployment
* IAM Roles and Instance Profiles
* GitHub Actions / Azure DevOps CI/CD
* Terraform validation pipeline
* tfsec / Checkov security scanning
* Infrastructure diagrams
* Automated documentation generation

---

# About the Author

This project was developed as part of my transition from Windows Infrastructure Engineering toward Cloud Engineering and DevOps.

Current areas of focus include:

* Terraform
* AWS
* Microsoft Azure
* PowerShell Automation
* Windows Server
* Hyper-V
* Infrastructure as Code
* Cloud Architecture

Feedback and suggestions are always welcome.
