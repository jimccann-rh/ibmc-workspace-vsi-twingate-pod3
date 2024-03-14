output "virtual_machine" {
  description = "Returns host info for all deployed virtual instance."
  value       = module.virtual-machines[0].instance
  sensitive   = true
}

output "private_vlan" {
  description = "Returns the private VLAN info."
  value       = module.vlans.private_compute_vlan
}
