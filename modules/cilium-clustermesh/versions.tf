terraform {
  required_providers {
    cilium = {
      source  = "littlejo/cilium"
      version = "~> 0.0.5"
    }
  }
  required_version = ">= 1.3"
}
