provider "ibm" {
  iaas_classic_api_key  = var.iaas_classic_api_key
  iaas_classic_username = var.iaas_classic_username
}

# Configure Twingate Provider
  provider "twingate" {
  api_token = var.tg_api_key
  network   = var.tg_network
}

