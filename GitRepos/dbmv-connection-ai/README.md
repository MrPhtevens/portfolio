# Introduction 
Connection AI infrastructure as code

# Installation

Azure CLI `https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?pivots=msi#install-or-update`
Terraform `choco install terraform`

# TL;DR

`az login`

`az account set --subscription <your-subscription-id>`

Need to set environments variables or use `providers.tf` for credentials (***Do not commit `providers.tf` with secrets***)

`terraform init`

`terraform workspace new dev`

`terraform workspace new uat`

`terraform workspace new staging`

`terraform workspace new prod`

`terraform workspace select dev`

`terraform init`

`terraform validate`

`terraform plan`

`terraform apply`
