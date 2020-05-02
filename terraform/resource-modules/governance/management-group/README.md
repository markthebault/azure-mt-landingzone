# Management Group

The module will create a parent management group and the given childrens in params

## Example

```javascript
  enabled = true
  management_groups = {
    root = {
      name = "Root group"
      children = [{
        name = "Child 1"
        subscription_ids = ["/subcriptions/****-**-*-****", "****-***-********"]
      },
      {
        name = "Child 2"
        subscription_ids = ["/subcriptions/****-**-*-****", "****-***-********"]
      }]
    }
  }

  tags = var.tags
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
| management\_groups | (Required) Gets the map of management groups and attached subscriptions | `map` | n/a | yes |
| tags | the given tags | `any` | n/a | yes |
| enabled | (Required) toggle to enable management group deployment | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| mgnt\_group | The created management group |
| children | Children mgnt groups attached to the parent |

