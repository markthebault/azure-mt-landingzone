##################### Variables
variable "name" {
  type        = string
  description = "Name of the applications service principals that will be created"
}

variable "app_additional_owners" {
  type        = list
  default     = []
  description = "Additional ObjectsID that will be assigned to the owners of the application"
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Enable the creation of the SPs"
}
variable "tags" {
  description = "A map of tags to set on every taggable resources."
  default     = []
}