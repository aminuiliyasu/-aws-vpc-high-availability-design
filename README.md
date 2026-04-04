# AWS VPC Architecture Project

## Overview
This project demonstrates the design and implementation of a secure and highly available AWS VPC architecture using public and private subnets.

The goal is to simulate a real-world cloud networking setup where:
- Public resources are accessible from the internet
- Private resources remain secure and isolated
- Internal communication is enabled
- Outbound internet access is controlled

---

## Architecture

The architecture includes:

- 1 VPC
- 2 Public Subnets (different Availability Zones)
- 2 Private Subnets (different Availability Zones)
- Internet Gateway
- NAT Gateway
- Route Tables
- Bastion Host (Jump Server)
- EC2 Instances

---

## Components Explained

### VPC (Virtual Private Cloud)
A logically isolated network in AWS where all resources are deployed.

---

### Public Subnet
- Connected to the Internet Gateway
- Allows inbound and outbound internet access
- Hosts the Bastion Server

---

### Private Subnet
- No direct internet access
- Uses NAT Gateway for outbound connections
- Hosts secure internal resources (e.g., application or database servers)

---

### Internet Gateway
- Enables communication between the VPC and the internet
- Attached to the public subnet

---

### NAT Gateway
- Allows private subnet instances to access the internet
- Blocks inbound traffic from the internet
- Deployed in the public subnet

---

### Route Tables
- Control traffic routing within the VPC

Public Route Table:
- Routes internet traffic → Internet Gateway

Private Route Table:
- Routes internet traffic → NAT Gateway

---

### Bastion Host (Jump Server)
- EC2 instance in the public subnet
- Used to securely access instances in private subnet via SSH

---

## Key Features

- Secure architecture using private subnets
- Controlled internet access via NAT Gateway
- High availability using multiple Availability Zones
- Bastion host for secure remote access
- Scalable and production-like network design

---

## What I Learned

- AWS VPC fundamentals
- Subnet design (public vs private)
- Routing and traffic flow in AWS
- Secure access patterns (Bastion Host)
- High availability best practices

---

## Optional
Add your architecture diagram screenshot here.

---

## Future Improvements

- Add Auto Scaling Groups
- Add Load Balancer (ALB)
- Use Infrastructure as Code (Terraform / CloudFormation)

---

## Author
Your Name