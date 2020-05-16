data "azurerm_subscription" "current" {
}

locals{
  tags = merge(var.tags, map("account", "audit"))
  prefix = "${var.customer_name}-${var.division}-${var.department}-${var.subscription_short_name}"

  #Security module names
  rg_name                     = "${local.prefix}-security-rg"
  log_analytics_name          = "${local.prefix}-security-la"
  activity_logs_sa_name       = replace("${local.prefix}-security-sa", "-", "")
  activity_logs_eventhub_name = "${local.prefix}-security-hub"

}

# Security module
module "security" {
  source  = "../../../terraform/infra-modules/security"
  
  rg_name                     = local.rg_name
  region                      = var.region
  log_analytics_name          = local.log_analytics_name
  activity_logs_sa_name       = local.activity_logs_sa_name
  activity_logs_eventhub_name = local.activity_logs_eventhub_name


  tags = local.tags
}

# Keyvault for Service principals
# ...
# ...


# Security policies configured for the management group
module "custom_policies" {
  source = "../../../terraform/resource-modules/governance/azure-policies"


  policies_matrix         = var.governance_policies_matrix
  log_analytics           = local.log_analytics_name
  scope                   = data.azurerm_subscription.current.id
}