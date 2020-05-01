# Resource role assignment

This module creates a role assigment for a given principal ID

## Usage

```javascript
    principal_id = module.sp.object_id
    roles = [
        {
            scope_id    = module.resource_group.resource_group.id,
            role        = "Contributor"
        }
    ]
```

