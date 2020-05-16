variable "rg_name" {
  description = "Name of the Resource Group"
}

variable "log_analytics_name" {
  description = "Name of the Log Anayltics Workspace"
}

variable "region" {
  description = "Geographic region resource will be deployed into"
}

variable "retention_period" {
  description = "Time in days to retain logs in the log analytics workspace"
  default     = 30
}


variable activity_logs_sa_name {
  type        = string
  description = "Name of the activity logs storage account"
}

variable activity_logs_eventhub_name {
  type        = string
  description = "Name of the activity logs event hub"
}



variable "tags" {
  description = "Tags to be added to resources"
  default = {}
}

