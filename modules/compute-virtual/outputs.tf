output "instance" {
  value = ibm_compute_vm_instance.instance
}

output "instance_private_ip" {
  value = ibm_compute_vm_instance.instance.ipv4_address_private
}

output "connector_name" {
  value = twingate_connector.tg_connector.name
}

