Linux Scale Set should use minimum 1 instance ; Linux Scale Set will create its own Traffic Manager that is accessible from the internet

module "azure-scale_set" {    
rg_name           = "my_default_rg" 
rg_region         = "Central US"  
vnet_name         = "my_default_vnet" 
vnet_ip           = ["10.0.0.0/16"] 
subnet1_name      = "my_subnet1"  
subnet1_ip        = ["10.0.1.0/24"] 
ss_name           = "myss01-12346"  
vm_sku            = "Standard_D2s_v3" 
instance_number   = 1 
admin_user_name   = "adminuser" 
canonical_name    = "Canonical" 
UbuntuServer_name = "UbuntuServer"    
image_sku_name    = "18.04-LTS" 
Standard_LRS_name = "Standard_LRS"  
}
