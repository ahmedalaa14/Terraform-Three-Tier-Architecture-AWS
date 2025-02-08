# Terraform-Three-Tier-Architecture-AWS

# Overview
This Terraform project sets up a three-tier infrastructure on a cloud provider. The architecture includes a Virtual Private Cloud (VPC), subnets for different tiers, security groups, instances, RDS, load balancer, and other necessary components.



## Features

- **Scalable Infrastructure:** Easily scale your infrastructure based on your needs.
- **Modular Design:** Organized codebase with reusable modules for improved maintainability.
- **Security:** Configures security groups and subnets to enhance the security of your infrastructure.

## Modules 
- Network Module: Manages the VPC, subnets, and networking components.
- Instances Module: Handles the creation of instances in both public and private subnets and creation of load balancer.
- Database Module: Manages and configures the relational database service (RDS) instances.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- Terraform installed on your local machine.
- Cloud provider credentials configured.

## Getting Started

Follow these steps to get your project up and running.

### 1. Clone the Repository
```bash
git clone https://github.com/ahmedalaa14/Terraform-Three-Tier-Architecture-AWS.git

cd Terraform-Three-Tier-Architecture-AWS
```
### 2. Initialize and Apply
```bash
terraform init
terraform apply