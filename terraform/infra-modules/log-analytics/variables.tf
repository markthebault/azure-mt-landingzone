variable "rg_name" {
  description = "Name of the Resource Group"
}

variable "la_name" {
  description = "Name of the Log Anayltics Workspace"
}

variable "region" {
  description = "Geographic region resource will be deployed into"
}

variable "retention_period" {
  description = "Time in days to retain logs in the log analytics workspace"
  default     = 30
}

variable "tags" {
  description = "Tags to be added to resources"
  default = {}
}
