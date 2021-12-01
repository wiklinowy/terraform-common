variable "rg" {
  description = "Resource group name."
}

variable "location" {
  description = "Location (region) of the resource group."
  type = string
}

variable "metadata" {
  description = "Mandatory SPGI tags."
}