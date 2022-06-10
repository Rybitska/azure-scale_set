
Linux Scale Set should use minimum 1 instance ; Linux Scale Set will create its own Traffic Manager that is accessible from the internet
=======

Azure virtual machine scale sets provide the management capabilities for applications that run across many VMs, automatic scaling of resources, and load balancing of traffic. Scale sets provide the following key benefits:

  1. Easy to create and manage multiple VMs
  2. Provides high availability and application resiliency
  3. Allows your application to automatically scale as resource demand changes
  4. Works at large-scale

  How to monitor your scale sets                
Use Azure Monitor for VMs, which has a simple onboarding process and will automate the collection of important CPU, memory, disk, and network performance counters from the VMs in your scale set. It also includes extra monitoring capabilities and pre-defined visualizations that help you focus on the availability and performance of your scale sets.

Enable monitoring for your virtual machine scale set application with Application Insights to collect detailed information about your application including page views, application requests, and exceptions. Further verify the availability of your application by configuring an availability test to simulate user traffic.
