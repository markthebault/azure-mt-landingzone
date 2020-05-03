locals {
  local_tags = {
    account = "audit"
  }
  

  tags = merge(local.tags, var.tags)
}

module "mgnt_group" {
  source  = "../../../terraform/resource-modules/governance/management-group"
  enabled = true
  
  management_groups = {
    root = {
      name = "${var.customer_name}"
      children = [{
        name = "${var.division}"
        subscription_ids = ["/subcriptions/****-**-*-****", "****-***-********"]
      }
    }
  }

  tags = local.tags
}