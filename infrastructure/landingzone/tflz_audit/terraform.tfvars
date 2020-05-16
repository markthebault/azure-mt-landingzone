subscription_id="b4aae396-63b8-4888-8b9a-099ae7238e89"
subscription_short_name="audt"

governance_policies_matrix = {
    autoenroll_monitor_vm   = false
    autoenroll_netwatcher   = false

    no_public_ip_spoke      = true
    cant_create_ip_spoke    = true 
    managed_disks_only      = true
    restrict_locations      = true
    list_of_allowed_locs    = ["westeurope"]
    restrict_supported_svc  = false
    msi_location            = "westeurope"
}

tags = {   
    component="audit"
}
