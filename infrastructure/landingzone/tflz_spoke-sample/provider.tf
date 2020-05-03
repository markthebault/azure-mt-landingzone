provider "azurerm" {
    version = "=2.6.0"
    subscription_id = var.subscription_id
    tenant_id = var.tenant_id
    client_id = var.tf_sp_appid
    client_secret = var.tf_sp_password


    features {}
}