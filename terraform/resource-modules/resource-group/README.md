# **Resource Modules: Resource Group**

## Description

This TF module creates a resource group 


## Example Variables
```javascript
  region          = "westeurope"
  name     = "p"
  tags = {
    terraform = true
  }
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| region | Region resource of the resource group | `any` | n/a | yes |
| name | Name of Resource Group | `any` | n/a | yes |
| tags | Tags that will be applied to the Resource Group | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| resource\_group | Create resource group |

