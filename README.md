# Portfolio

A collection of Terraform infrastructure-as-code and Python automation projects showcasing cloud engineering skills across AWS and Azure. References to actual working infrastructure have been redacted/replaced for privacy and secuirity reasons

## Terraform

**terraform/aws-sdwan-multi-region/**
Multi-region AWS SD-WAN deployment using Netskope. Provisions VPCs, subnets, security groups, EC2 instances, and network interfaces across ap-southeast-1, ap-southeast-2, eu-west-2, and us-west-2 with HA failover.

**terraform/aws-internal-infrastructure/**
AWS internal production infrastructure including VPCs, EC2 instances, ALB/NLB load balancers, AD Connector for AWS WorkSpaces, transit gateways, and directory services across multiple regions.

**terraform/aws-vpc-module/**
Reusable VPC module with public/private subnets, NAT gateway, internet gateway, and route tables.

**terraform/azure-ml-platform/**
Azure ML platform built with modular Terraform. Deploys resource groups, storage accounts, key vaults, container registries, ML workspaces, compute clusters/instances, function apps, and application insights. Includes an Azure DevOps CI/CD pipeline with multi-stage deployments (dev → uat → prod) and manual approval gates.

**terraform/azure-ml-multi-env/**
Azure ML infrastructure using `for_each` loops to deploy identical resource stacks across dev, test, and prod environments from a single variable definition.

**terraform/azure-batch-compute/**
Azure Batch compute environment with batch pools, storage accounts, and Windows VMs using Shared Image Gallery images.

## Python

**python/ec2_instance_manager.pyw**
Tkinter GUI app for managing AWS EC2 instances — start, stop, change instance types, and monitor health checks with a visual dashboard.

**python/s3_uploader.py**
PySimpleGUI app for uploading files to S3 buckets with bucket discovery and file browsing.

**python/export_unused_workspaces.py**
Reports on AWS WorkSpaces usage — identifies workspaces that have never been used or haven't been accessed within a configurable threshold.

**python/export_active_workspaces.py**
Exports all active AWS WorkSpaces to a CSV file.
