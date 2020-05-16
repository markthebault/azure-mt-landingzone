locals{
  tags = merge(var.tags, map("account", "audit"))
  prefix = "${var.customer_name}-${var.division}-${var.department}"
}


module "security" {
  source  = "../../../terraform/infra-modules/security"
  
  rg_name                     = "${local.prefix}-security-rg"
  region                      = var.region
  log_analytics_name          = "${local.prefix}-security-la"
  activity_logs_sa_name       = replace("${local.prefix}-security-sa", "-", "")
  activity_logs_eventhub_name = "${local.prefix}-security-hub"


  tags = local.tags
}