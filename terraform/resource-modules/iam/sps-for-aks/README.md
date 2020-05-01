# Service principal for AKS cluster

This module creates two services principals, one for the server app for aks, and the other one for the client aks

## Usage

```javascript
    enable = true //to create the services principals
    name = "company-department-aks"
    app_additional_owners = ["*****-*********-*******"] //list of objects ids of the AAD
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
| random | n/a |
| azuread | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name of the applications service principals that will be created | `string` | n/a | yes |
| app\_additional\_owners | Additional ObjectsID that will be assigned to the owners of the application | `list` | `[]` | no |
| enabled | Enable the creation of the SPs | `bool` | `true` | no |
| tags | A map of tags to set on every taggable resources. | `list` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| server\_sp | Server SP created for AKS |
| server\_app\_secret | Server Secret SP created for AKS |
| client\_sp | client SP created for AKS |

