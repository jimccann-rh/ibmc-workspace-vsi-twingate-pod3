terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "1.53.0"
    }
    twingate = {
      source = "twingate/twingate"
    }
  }
}
