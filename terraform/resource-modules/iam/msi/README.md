# aks-msi-roles

## Roles example

```json
[
  {
    scope_id = "/subscriptions/<guid>/resourceGroups/<rg-name>/providers/...",
    role_definition    = "Reader and Data Access",
  },
  { ... }
]
```

## Getting the values

### Service Principal Id

1. get the client id of the service principal from your aks cluster

```sh
az aks show -g <resourcegroup> -n <name> --query servicePrincipalProfile.clientId -o tsv
```

2. get the object id from this clientId

```sh
az ad sp show --id <result from the command of 1.> --query objectId
```

or, do it all in one line

```sh
az aks show -g <resourcegroup> -n <name> --query servicePrincipalProfile.clientId -o tsv | xargs az ad sp show --query objectId --id
```

## Test this Module

First change directory to `test`.

```sh
cd test
```

then initialize the test.

```sh
go mod init midroles
```

When that was successful, you can run the test.

```sh
go test -v -timeout 30m
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Providers

| Name    | Version |
| ------- | ------- |
| azurerm | >1.36.0 |

## Inputs

| Name           | Description                                                                                                | Type     | Default | Required |
| -------------- | ---------------------------------------------------------------------------------------------------------- | -------- | ------- | :------: |
| location       | Location of where the user assigned managed identity will be deployed to                                   | `string` | n/a     |   yes    |
| name           | Name of the user assigned managed identity which will be used in the helm chart for referencing <a-idname> | `string` | n/a     |   yes    |
| resource_group | Name of the Resource Group where the user assigned Managed Identity should be deployed                     | `string` | n/a     |   yes    |
| roles          | The information about which access the msi should get to which resources                                   | `any`    | n/a     |   yes    |

## Outputs

| Name                              | Description                                                                                                        |
| --------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| assigned_client_id                | Client ID associated with the user assigned identity. Referenced in AKS kind: AzureIdentity 'ClientID:' <clientId> |
| assigned_principal_id             | Service Principal ID associated with the user assigned identity.                                                   |
| current_subscription_display_name | n/a                                                                                                                |
| managed_identity_name             | The name what you need for your Azure Identity Binding <a-idname>                                                  |
| user_assigned_identity_id         | The user assigned identity ID. Referenced in AKS kind: AzureIdentity 'ResourceID: /subscriptions/...'              |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
