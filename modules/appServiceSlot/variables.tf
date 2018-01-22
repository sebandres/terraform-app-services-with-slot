# What the application name is
variable "application_name" {
  type = "string"
}

# Environment
variable "environment" {
  type = "string"
}

# Azure appservice service plan
variable "azure_appservice_plan" {
  type = "string"
}

# Default Azure Location
variable "azure_location" {
  type        = "string"
  description = "Azure datacenter to deploy to."
  default     = "Australia East"
}

# The resource group the resources will be created in
variable "azure_resource_group_name" {
  type = "string"
}

variable "ignore" {
  type = "string"
}

variable "appSetting1" {
  type        = "string"
  description = "My slot variable"
}

variable "depends_on" {
  type        = "string"
  description = "Parent module this slot depends on"
}
