
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
  type        = list(any)
  default     = ["10.0.0.0/16"]
}


variable "subnet1_name" {
  description = "SUbnet name"
  type        = string
  default     = "my_subnet1"
}

variable "subnet1_ip" {
  description = "Subnet 1  Ip"
  type        = list(any)
  default     = ["10.0.1.0/24"]
}
variable "ss_name" {
  description = "ss name"
  type        = string
  default     = "my_ss01"
}



variable "vm_sku" {
  description = "Virtual Machine SKU"
  type        = string
  default     = "Standard_D2s_v3"
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

variable "canonical_name" {
  description = "canonical user name"
  type        = string
  default     = "canonical"
}

variable "UbuntuServer_name" {
  description = "Server type"
  type        = string
  default     = "UbuntuServer"
}
variable "image_sku_name" {
  description = "image_sku name"
  type        = string
  default     = "20.04-LTS"
}

variable "Standard_LRS_name" {
  description = "Standard_LRS name"
  type        = string
  default     = "Standard_LRS"
}