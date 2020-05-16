data "azurerm_subscription" "current" {
}


locals{
  tags = merge(var.tags, map("account", "shared-services"))
  prefix = "${var.customer_name}-${var.division}-${var.department}-${var.subscription_short_name}"

  #Security module names
  sec_rg_name                 = "${local.prefix}-security-rg"
  log_analytics_name          = "${local.prefix}-security-la"
  activity_logs_sa_name       = replace("${local.prefix}-sec-sa", "-", "")
  activity_logs_eventhub_name = "${local.prefix}-security-hub"

  #Hub module
  hub_rg_name    = "${local.prefix}-hub-rg"
  hub_vnet_name  = "${var.customer_name}-${var.region_short_name}-vnet"
  hub_gwip_name  = "${var.customer_name}-${var.region_short_name}-gw-ip"
  hub_gw_name    = "${var.customer_name}-${var.region_short_name}-gw"
  hub_nsg_name   = "${var.customer_name}-${var.region_short_name}-nsg"

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
# Security policies configured for the Subscription
#####################################################
module "az_policies" {
  source = "../../../terraform/resource-modules/governance/azure-policies"


  policies_matrix         = var.governance_policies_matrix
  log_analytics           = local.log_analytics_name
  scope                   = data.azurerm_subscription.current.id
}


#####################################################
# Hub Vnet
#####################################################

module "hub_vnet" {
  source  = "../../../terraform/infra-modules/network-hub"

  rg_name                 = local.hub_rg_name
  vnet_name               = local.hub_vnet_name
  gwip_name               = local.hub_gwip_name
  gw_name                 = local.hub_gw_name
  nsg_name                = local.hub_nsg_name

  vnet_address_ranges     = var.hub_cidrs
  subnets                 = var.hub_subnets
  nsg_rules_public        = var.hub_nsg_rules_public_subnet
  client_address_spaces   = var.hub_client_address_spaces
  vpn_client_protocols    = var.hub_vpn_client_protocols
  region                  = var.region
  certificate_data        = "MIIDuzCCAqOgAwIBAgIQCHTZWCM+IlfFIRXIvyKSrjANBgkqhkiG9w0BAQsFADBnMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSYwJAYDVQQDEx1EaWdpQ2VydCBGZWRlcmF0ZWQgSUQgUm9vdCBDQTAeFw0xMzAxMTUxMjAwMDBaFw0zMzAxMTUxMjAwMDBaMGcxCzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xJjAkBgNVBAMTHURpZ2lDZXJ0IEZlZGVyYXRlZCBJRCBSb290IENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvAEB4pcCqnNNOWE6Ur5jQPUH+1y1F9KdHTRSza6k5iDlXq1kGS1qAkuKtw9JsiNRrjltmFnzMZRBbX8Tlfl8zAhBmb6dDduDGED01kBsTkgywYPxXVTKec0WxYEEF0oMn4wSYNl0lt2eJAKHXjNfGTwiibdP8CUR2ghSM2sUTI8Nt1Omfc4SMHhGhYD64uJMbX98THQ/4LMGuYegou+dGTiahfHtjn7AboSEknwAMJHCh5RlYZZ6B1O4QbKJ+34Q0eKgnI3X6Vc9u0zf6DH8Dk+4zQDYRRTqTnVO3VT8jzqDlCRuNtq6YvryOWN74/dq8LQhUnXHvFyrsdMaE1X2DwIDAQABo2MwYTAPBgNVHRMBAf8EBTADAQH/MA4GA1UdDwEB/wQEAwIBhjAdBgNVHQ4EFgQUGRdkFnbGt1EWjKwbUne+5OaZvRYwHwYDVR0jBBgwFoAUGRdkFnbGt1EWjKwbUne+5OaZvRYwDQYJKoZIhvcNAQELBQADggEBAHcqsHkrjpESqfuVTRiptJfP9JbdtWqRTmOf6uJi2c8YVqI6XlKXsD8C1dUUaaHKLUJzvKiazibVuBwMIT84AyqRQELn3e0BtgEymEygMU569b01ZPxoFSnNXc7qDZBDef8WfqAV/sxkTi8L9BkmFYfLuGLOhRJOFprPdoDIUBB+tmCl3oDcBy3vnUeOEioz8zAkprcb3GHwHAK+vHmmfgcnWsfMLH4JCLa/tRYL+Rw/N3ybCkDp00s0WUZ+AoDywSl0Q/ZEnNY0MsFiw6LyIdbqM/s/1JRtO3bDSzD9TazRVzn2oBqzSa8VgIo5C1nOnoAKJTlsClJKvIhnRlaLQqk="


  tags = local.tags

}