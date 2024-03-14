locals {
  deploy_date = formatdate("YYYY-MM-DD", timestamp())
  ssh_key_ids = var.existing_ssh_key != "" ? [data.ibm_compute_ssh_key.existing[0].id, ibm_compute_ssh_key.project.id] : [ibm_compute_ssh_key.project.id]
  # Tags will be applied to all resources that support them.
  tags = [
    "datacenter:${var.datacenter}",
    "project:${var.project}",
    "workspace:${terraform.workspace}",
    "provider:ibm"
  ]
}

resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "null_resource" "create_private_key" {
  provisioner "local-exec" {
    command = <<-EOT
      echo '${tls_private_key.ssh.private_key_pem}' > ./'${var.project}'.pem
      chmod 400 ./'${var.project}'.pem
    EOT
  }
}

resource "ibm_compute_ssh_key" "project" {
  label      = "${var.project}-sshkey-twingate"
  public_key = tls_private_key.ssh.public_key_openssh
  tags       = local.tags
}

#module "vlans" {
#  source     = "./modules/vlans"
#  datacenter = var.datacenter
#  tags       = local.tags
#}

module "virtual-machines" {
#  depends_on   = [module.vlans]
  source       = "./modules/compute-virtual"
  count        = var.vsicount 
  name         = "${var.project}-twingate-virtual-instance-${count.index}"
  datacenter   = var.datacenter
  domain_name  = var.domain_name
  public_vlan  = var.tg_public_vlan
#  public_vlan  = module.vlans.public_compute_vlan.id
#  private_vlan = module.vlans.private_compute_vlan.id
  private_vlan = var.tg_private_vlan
  local_disk   = false
  ssh_key_ids  = local.ssh_key_ids
  tags         = local.tags
  psgids        = var.psgids
  tg_remote_network_id = var.tg_remote_network_id
  tg_network = var.tg_network
  tg_api_key = var.tg_api_key
}

