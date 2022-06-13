# Linux Scale Set should use minimum 1 instance.
# Linux Scale Set will create its own Load Balancer that is accessible from the internet


Azure virtual machine scale sets provide the management capabilities for applications that run across many VMs, automatic scaling of resources, and load balancing of traffic. Scale sets provide the following key benefits:

  * Easy to create and manage multiple VMs
  * Provides high availability and application resiliency
  * Allows your application to automatically scale as resource demand changes
  * Works at large-scale


  # How to monitor your scale sets                
Use Azure Monitor for VMs, which has a simple onboarding process and will automate the collection of important CPU, memory, disk, and network performance counters from the VMs in your scale set. It also includes extra monitoring capabilities and pre-defined visualizations that help you focus on the availability and performance of your scale sets.

Enable monitoring for your virtual machine scale set application with Application Insights to collect detailed information about your application including page views, application requests, and exceptions. Further verify the availability of your application by configuring an availability test to simulate user traffic.



# Load Balancer
Load balancing refers to evenly incoming network traffic across a group of backend resources or servers.

TCP port 22 is used for secure remote login by connecting an SSH client application with an SSH server. This rule resolution is part of the Conformity Security & Compliance tool for Azure.

After you've created a VM that's configured to serve web requests on the standard TCP port 80, you can: Create a network security group. Create an inbound security rule allowing traffic and assign values to the following settings: Destination port ranges: 80.
 
#          
   

```
module "azure-scale_set" {
    source = ""
rg_name           = "my_test4SS_rg"
rg_region         = "Central US"
vnet_name         = "my_default_test_vnet"
vnet_ip           = ["10.0.0.0/16"]
subnet1_name      = "my_subnet1"
subnet1_ip        = ["10.0.1.0/24"]
ss_name           = "mytestss-12346"
vm_sku            = "Standard_D2s_v3"
instance_number   = 1
admin_user_name   = "adminuser"
admin_password    = "&*$867user34"
canonical_name    = "Canonical"
UbuntuServer_name = "UbuntuServer"
image_sku_name    = "18.04-LTS"
Standard_LRS_name = "Standard_LRS"
}
```
## Execute following commands
```
terraform init
```
```
terraform plan
```
```
terraform apply
```
 :tada: :fireworks:

