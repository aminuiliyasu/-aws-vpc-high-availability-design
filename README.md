# AWS VPC High Availability Architecture with Web Application Deployment

## Overview

This project demonstrates the design, implementation, and deployment of a secure, highly available AWS VPC architecture integrated with a web application. The infrastructure leverages public and private subnets to ensure security, scalability, and fault tolerance in a cloud environment.

The primary objectives include:
- Establishing a robust network foundation with VPC, subnets, and gateways
- Implementing secure access patterns using a Bastion Host
- Deploying a web application across multiple availability zones
- Configuring load balancing for high availability and traffic distribution
- Ensuring controlled internet access and internal communication

This setup simulates a production-ready cloud infrastructure, showcasing best practices for AWS networking, security, and application deployment.

---

## Architecture

The architecture encompasses a comprehensive AWS setup:

- **1 VPC** with CIDR block for network isolation
- **2 Public Subnets** across different Availability Zones for internet-facing resources
- **2 Private Subnets** across different Availability Zones for secure internal resources
- **Internet Gateway** for public internet connectivity
- **NAT Gateway** for controlled outbound access from private subnets
- **Route Tables** for traffic routing management
- **Bastion Host (Jump Server)** for secure remote access
- **EC2 Instances** for web application hosting
- **Application Load Balancer** for traffic distribution
- **Target Groups** for health checking and routing

---

## Components Explained

### VPC (Virtual Private Cloud)
A logically isolated network in AWS where all resources are deployed, providing complete control over the virtual networking environment.

### Public Subnet
- Connected to the Internet Gateway
- Enables inbound and outbound internet access
- Hosts resources requiring external connectivity, such as the Bastion Server

### Private Subnet
- Isolated from direct internet access
- Utilizes NAT Gateway for outbound connections only
- Hosts sensitive resources like application servers and databases

### Internet Gateway
- Facilitates bidirectional communication between the VPC and the internet
- Attached exclusively to public subnets

### NAT Gateway
- Enables private subnet instances to initiate outbound internet connections
- Prevents unsolicited inbound traffic from the internet
- Deployed within a public subnet for accessibility

### Route Tables
- Define routing rules for network traffic within the VPC

**Public Route Table:**
- Directs internet-bound traffic to the Internet Gateway

**Private Route Table:**
- Routes outbound traffic through the NAT Gateway

### Bastion Host (Jump Server)
- EC2 instance positioned in the public subnet
- Serves as a secure entry point for accessing private subnet resources via SSH
- Implements defense-in-depth security practices

### Application Load Balancer
- Distributes incoming traffic across multiple EC2 instances
- Performs health checks to ensure traffic is only routed to healthy instances
- Enhances application availability and fault tolerance

---

## Implementation Steps

This section provides a detailed, step-by-step guide to implementing the AWS infrastructure and deploying the web application, with corresponding screenshots from the AWS Management Console.

### Step 1: Create VPC
Establish the foundational virtual network with appropriate CIDR blocks and DNS settings.

![Create VPC](images/1_create-vpc.png)

### Step 2: Create Subnets
Configure public and private subnets across multiple availability zones for high availability.

![Subnets Created](images/2_subnets_created.png)

### Step 3: Create Internet Gateway
Attach an Internet Gateway to enable internet connectivity for public resources.

![Internet Gateway Created](images/3_internet_gateway_created.png)

### Step 4: Create Route Tables
Set up routing rules to control traffic flow between subnets and external networks.

![Route Table Created](images/4_route_table_created.png)

### Step 5: Create NAT Gateway
Deploy NAT Gateway in a public subnet to allow outbound internet access from private subnets.

![NAT Gateway](images/5_NAT-Gateway.png)

### Step 6: Launch Bastion Host
Deploy an EC2 instance in the public subnet to serve as a secure jump server.

![Jump Server or Bastion Host](images/6_Jump_server_or_Bastion-Host.png)

![Bastion 2](images/6b_Bastion_2.png)

### Step 7: Configure Bastion SSH Access
Establish secure SSH connection to the Bastion Host for remote management.

![Bastion SSH](images/7_bastion-ssh.png)

### Step 8: Set Up WebApp Key in Bastion
Configure SSH keys on the Bastion Host for accessing private instances.

![WebApp Key in Bastion](images/8_webapp-key-in-bastion.png)

### Step 9: Launch WebApp EC2 Instance
Deploy the web application server in a private subnet.

![WebApp EC2 Instance Created](images/9-webApp-ec2-instance-created.png)

### Step 10: SSH to WebApp from Bastion
Securely connect to the web application instance through the Bastion Host.

![SSH to WebApp from Bastion](images/10-ssh-to-webApp-from-Bastion.png)

### Step 11: Install Required Packages
Install Apache2, wget, and unzip on the web application server.

![Apache2 Wget Unzip Packages Install in WebApp](images/11-apache2-wget-unzip-packages-install-in-webapp.png)

### Step 12: Download Website Files
Retrieve the web application files using wget.

![Website Download with Wget](images/12-website-download-with-wget.png)

### Step 13: Extract Website Files
Unzip the downloaded web application archive.

![Unzip the Website](images/13-unzip-the-website.png)

### Step 14: Configure Website
Set up the web application files and Apache configuration.

![Website Set Up](images/14-website-set-up.png)

### Step 15: Create Target Group
Configure a target group for the Application Load Balancer with health check settings.

![Target Group Created](images/15-target-group-created.png)

### Step 16: Create Load Balancer
Deploy an Application Load Balancer to distribute traffic across instances.

![Load Balancer Created](images/16-load-balancer-created.png)

### Step 17: Configure Security Groups
Update security groups to allow traffic from the Load Balancer to web application instances.

![Allow Load Balancer from WebApp Security Group](images/17-allow-loadbalancer-from-webapp-security-group.png)

### Step 18: Obtain Load Balancer URL
Retrieve the DNS name of the Load Balancer for accessing the application.

![Getting the URL from Load Balancer to Access the Site](images/18-getting-the-url-from-loadbalancer-to-access-the-site.png)

### Step 19: Verify Deployed Application
Confirm the web application is successfully deployed and accessible.

![Deployed App Screenshot](images/19-deployed_app-screenshot.png)

---

## Key Features

- **Secure Network Architecture**: Utilizes private subnets and controlled access patterns
- **High Availability**: Multi-AZ deployment with load balancing
- **Scalable Design**: Modular infrastructure supporting horizontal scaling
- **Production-Ready**: Implements AWS best practices for security and reliability
- **Bastion Host Access**: Secure remote management of private resources
- **Load Balancing**: Automatic traffic distribution and health monitoring
- **Outbound Internet Control**: NAT Gateway for secure external connectivity

---

## What I Learned

- Advanced AWS VPC design and subnetting strategies
- Implementation of secure access patterns with Bastion Hosts
- Load balancing and auto-scaling concepts in AWS
- Infrastructure security best practices
- Multi-AZ high availability architectures
- EC2 instance management and configuration
- Application deployment in cloud environments
- Network traffic routing and firewall configurations
- AWS resource interdependencies and deployment sequencing

---

## Future Improvements

- Implement Infrastructure as Code using Terraform or AWS CloudFormation
- Add Auto Scaling Groups for dynamic resource management
- Integrate monitoring and logging with AWS CloudWatch
- Implement CI/CD pipelines for automated deployments
- Add database layer with RDS in private subnets
- Configure SSL/TLS certificates for secure HTTPS access
- Implement backup and disaster recovery strategies

---

## Author
Aminu Iliyasu