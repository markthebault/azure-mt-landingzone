#Definition ID: /providers/Microsoft.Authorization/policyDefinitions/a08ec900-254a-4555-9bf5-e42af04b5c5c
#Name: Allowed resource types

resource "azurerm_policy_assignment" "res_type" {
  count = var.policies_matrix.restrict_supported_svc ? 1 : 0
  name                 = "res_svc"
  scope                =  var.scope
  policy_definition_id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/providers/Microsoft.Authorization/policyDefinitions/a08ec900-254a-4555-9bf5-e42af04b5c5c"
  description          = "Policy Assignment with Terraform"
  display_name         = "TF Restrict Deployment of specified Azure Resources"

  parameters = <<PARAMETERS
    {
      "listOfResourceTypesAllowed": {
        {
                "value" : "${var.policies_matrix.list_of_supported_svc}"
              }
    }
    }
PARAMETERS
}
