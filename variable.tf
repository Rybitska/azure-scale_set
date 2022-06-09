
variable "rg_name" {
  description = "Resource group name"
  type        = string
  default     = "my_default_rg"
}
variable "rg_region" {
  description = "Resource group location"
  type        = string
  default     = "Central US"
}

variable "vnet_name" {
  description = "VNET name"
  type        = string
  default     = "my_default_vnet"
}

variable "vnet_ip" {
  description = "VNET Ip"
  type        = string
  default     = "10.0.0.0/16"
}