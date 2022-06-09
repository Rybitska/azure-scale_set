
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


variable "subnet1_name" {
  description = "SUbnet name"
  type        = string
  default     = "my_subnet1"
}

variable "subnet1_ip" {
  description = "Subnet 1  Ip"
  type        = string
  default     = "10.0.1.0/24"
}
variable "ss_name" {
  description = "ss name"
  type        = string
  default     = "my_ss01"
}



variable "SKU_value" {
  description = "SKU"
  type        = string
  default     = "Standard_F2"
}

variable "instance_number" {
  description = "Number of instance"
  type        = number
  default     = 1
}

variable "admin_user_name" {
  description = "Admin user name"
  type        = string
  default     = "adminuser"
}
