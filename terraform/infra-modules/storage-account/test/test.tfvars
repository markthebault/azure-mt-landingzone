rg_name = "sa-rg"
region = "westeurope"
stor_name = "exmthsa"

log_analytics_workspace_id = "/subscriptions/eecb1c38-f485-488a-ae6d-041ca1eef750/resourcegroups/mth-static-stuff/providers/microsoft.operationalinsights/workspaces/mth-default-log"

file_shares = [{
    file_share_name  = "default-fileshare"
    data_share_quota = 5
}]

containers = [{
    name        = "mycont"
    access_type = "private"
}]

tags = {
  test = true
}