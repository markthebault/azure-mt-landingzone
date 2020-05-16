variable "policies_matrix" {
  description = "Matrix of settings that will be applied to the configuration container - typically management group"
  
  default = {
    autoenroll_monitor_vm   = true
    autoenroll_netwatcher   = false

    no_public_ip_spoke      = false
    cant_create_ip_spoke    = false 
    managed_disks_only      = true
    restrict_locations      = false
    list_of_allowed_locs    = ["westeurope"]
    restrict_supported_svc  = false
    list_of_supported_svc   = ["Microsoft.Network/publicIPAddresses", "Microsoft.Compute/disks"]
    msi_location            = "westeurope"
  }
}

variable "scope" {
  description = "The scope  where the policies will be assigned"
}

variable "log_analytics" {
  description = "Log analytics repository"
}
