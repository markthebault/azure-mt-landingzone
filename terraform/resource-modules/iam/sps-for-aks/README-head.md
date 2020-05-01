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



