# Default Azure Location
variable "azure_location" {
  type        = "string"
  description = "Azure datacenter to deploy to."
  default     = "Australia East"
}

# Default AWS Region
variable aws_region {
  type    = "string"
  default = "ap-southeast-2"
}

# What the application name is
variable application_name {
  type    = "string"
  default = "TerraformAppSettingsExample"
}

# Infrastructure Version
variable "version" {
  type    = "string"
  default = "0.1.0"
}

# Environment
variable "environment" {
  type = "string"
}

# appSetting1
variable "appSetting1" {
  type    = "string"
  default = ""
}

variable "azure_appservice_plan" {
  type    = "string"
  default = "DotNetPublic"
}
