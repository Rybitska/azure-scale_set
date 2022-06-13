# Linux Scale Set should use minimum 1 instance.
# Linux Scale Set will create its own Traffic Manager that is accessible from the internet


Azure virtual machine scale sets provide the management capabilities for applications that run across many VMs, automatic scaling of resources, and load balancing of traffic. Scale sets provide the following key benefits:

  * Easy to create and manage multiple VMs
  * Provides high availability and application resiliency
  * Allows your application to automatically scale as resource demand changes
  * Works at large-scale


  # How to monitor your scale sets                
Use Azure Monitor for VMs, which has a simple onboarding process and will automate the collection of important CPU, memory, disk, and network performance counters from the VMs in your scale set. It also includes extra monitoring capabilities and pre-defined visualizations that help you focus on the availability and performance of your scale sets.

Enable monitoring for your virtual machine scale set application with Application Insights to collect detailed information about your application including page views, application requests, and exceptions. Further verify the availability of your application by configuring an availability test to simulate user traffic.



# Traffic Manager 
   Traffic Manager provides you with DNS (Domain Name System) level routing. This service allows your end users to get directed to healthy endpoints based on the routing method of your choosing.

Using Traffic View, you can:
  1. Understand where your user bases are located (up to a local DNS resolver level granularity).
  2. View the volume of traffic (observed as DNS queries handled by Azure Traffic Manager) originating from these regions.
  3. Get insights into what is the representative latency experienced by these users.
  4. Deep dive into the specific traffic patterns from each of these user bases to Azure regions where you have endpoints.



# How Traffic View works          
   Traffic View works by look at the incoming queries received over the last seven days for a profile. From the incoming queries information, Traffic View extracts the source IP of the DNS resolver used to represent the location of the users. This information gets grouped together at a DNS resolver level to create user-base regions. Traffic Manager maintains the geographic information of IP addresses. Traffic Manager then looks at the Azure regions to which the query gets routed and constructs a traffic flow map for users from those regions.

In the next step, Traffic Manager correlates the user base region to Azure region mapping with the network intelligence latency tables. This table is maintained for different end-user networks to understand the average latency experienced by users from those regions when connecting to Azure regions. All these calculations are then combined at a per local DNS resolver IP level before it's presented to you. You can consume the information in various ways.

The frequency of Traffic view data update depends on multiple internal service variables. However, the data is updated once every 48 hours.

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

