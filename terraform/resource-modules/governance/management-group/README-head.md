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

