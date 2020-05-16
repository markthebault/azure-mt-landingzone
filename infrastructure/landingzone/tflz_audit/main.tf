data "azurerm_subscription" "current" {
}

data "azurerm_management_group" "root" {
  name = var.root_mgnt_group_name
}

resource "random_string" "kv_rand" {
  length  = 4
  special = false
  upper   = false
}


locals{
  tags = merge(var.tags, map("account", "audit"))
  prefix = "${var.customer_name}-${var.division}-${var.department}-${var.subscription_short_name}"

  #Security module names
  sec_rg_name                 = "${local.prefix}-security-rg"
  log_analytics_name          = "${local.prefix}-security-la"
  activity_logs_sa_name       = replace("${local.prefix}-sec-sa", "-", "")
  activity_logs_eventhub_name = "${local.prefix}-security-hub"

  # Keyvault
  kv_rg_name  = "${local.prefix}-kv-rg"
  kv_name     = "${var.customer_name}${var.subscription_short_name}${random_string.kv_rand.result}"
}



#####################################################
# Security module
#####################################################
module "security" {
  source  = "../../../terraform/infra-modules/security"
  
  rg_name                     = local.sec_rg_name
  region                      = var.region
  log_analytics_name          = local.log_analytics_name
  activity_logs_sa_name       = local.activity_logs_sa_name
  activity_logs_eventhub_name = local.activity_logs_eventhub_name


  tags = local.tags
}


#####################################################
# Security policies configured for the management group
#####################################################
module "az_policies" {
  source = "../../../terraform/resource-modules/governance/azure-policies"


  policies_matrix         = var.governance_policies_matrix
  log_analytics           = local.log_analytics_name
  scope                   = data.azurerm_subscription.current.id
}



#####################################################
# Keyvault for Service principals, tenant secrets and certificates
#####################################################
module "kv_rg"{
  source = "../../../terraform/resource-modules/resource-group"
  
  region  = var.region
  name    = local.kv_rg_name
  tags    = merge(local.tags, map("module", "keyvault"))
}

module "customer_keyvault" {
  source = "../../../terraform/resource-modules/security/key-vault"

  name                       = local.kv_name
  resource_group             = module.kv_rg.resource_group
  log_analytics_workspace_id = module.security.log_analytics.id
  tags                       = merge(local.tags, map("module", "keyvault"))
}
