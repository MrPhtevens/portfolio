# Portfolio

A collection of Terraform infrastructure-as-code and Python automation projects showcasing cloud engineering skills across AWS and Azure.

## Projects

### Terraform

**GitRepos/IT/Prod/Core-Network/**
Multi-region AWS SD-WAN deployment using Netskope. Provisions VPCs, subnets, security groups, EC2 instances, and network interfaces across ap-southeast-1, ap-southeast-2, eu-west-2, and us-west-2 with HA failover.

**GitRepos/IT/Prod/Internal-Prod/**
AWS internal production infrastructure including VPCs, EC2 instances, ALB/NLB load balancers, AD Connector for AWS WorkSpaces, transit gateways, and directory services across multiple regions.

**GitRepos/IT/Workload/**
Reusable VPC module with public/private subnets, NAT gateway, internet gateway, and route tables.

**GitRepos/dbmv-connection-ai/**
Azure ML platform built with modular Terraform. Deploys resource groups, storage accounts, key vaults, container registries, ML workspaces, compute clusters/instances, function apps, and application insights. Includes an Azure DevOps CI/CD pipeline with multi-stage deployments (dev → uat → prod) and manual approval gates.

**GitRepos/gits/DEVOPS-Cloud Infra/Terraform/ML/**
Azure ML infrastructure using `for_each` loops to deploy identical resource stacks across dev, test, and prod environments from a single variable definition.

**GitRepos/Kirchs Devops/Batch/**
Azure Batch compute environment with batch pools, storage accounts, and Windows VMs using Shared Image Gallery images.

### Python

**RandomPythonStuff/DE_MAAInstanceStarter.pyw**
Tkinter GUI app for managing AWS EC2 instances — start, stop, change instance types, and monitor health checks with a visual dashboard.

**RandomPythonStuff/s3uploader.py**
PySimpleGUI app for uploading files to S3 buckets with bucket discovery and file browsing.

**RandomPythonStuff/ExportUnused workspaces.py**
Reports on AWS WorkSpaces usage — identifies workspaces that have never been used or haven't been accessed within a configurable threshold.

**RandomPythonStuff/Export Active workspaces.py**
Exports all active AWS WorkSpaces to a CSV file.
