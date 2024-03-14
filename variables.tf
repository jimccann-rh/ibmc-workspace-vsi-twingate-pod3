variable "iaas_classic_api_key" {
  description = "The API key for the IBM Cloud Classic infrastructure service."
  type        = string
  sensitive = true
}

variable "iaas_classic_username" {
  description = "The username for the IBM Cloud Classic infrastructure service."
  type        = string
  sensitive = true
}

variable "datacenter" {
  description = "The datacenter in which to provision compute."
  type        = string
}

variable "project" {
  description = "Prefix to add to all resources for easier identification."
  type        = string
}

variable "existing_ssh_key" {
  description = "The name of an existing SSH key to use for the virtual machines. If none is provided, one will be generated."
  type        = string
  default     = ""
}

variable "domain_name" {
  description = "The domain name to use for all resources."
  type        = string
  default     = "example.com"
}

variable "vsicount" {
  description = "Number of VSI systems"
  type        = string
  default     = "1"
}

variable "psgids" {
  description = "public security group ids VSI systems"
  type        = list
  default     = []
}

#variable "vm-post-install-script-uri" {
# default = "https://binaries.twingate.com/connector/setup.sh"
#}


variable "tg_remote_network_id" {
  description = "twingate remote network id"
  type        = string
  default     = ""
  sensitive = true
}

variable "tg_network" {
  description = "twingate network"
  type        = string
  default     = ""
}

variable "tg_api_key" {
  description = "twingate api key"
  type        = string
  default     = ""
  sensitive = true
}

variable "tg_private_vlan" {
  description = "Private VLAN of BMS systems"
  type        = number
}

variable "tg_private_subnet" {
  description = "Private subnet of BMS systems"
  type        = string
  default     = ""
}

variable "tg_public_vlan" {
  description = "Public VLAN of BMS systems"
  type        = number
}

variable "tg_public_subnet" {
  description = "Public subnet of BMS systems"
  type        = string
  default     = ""
}
