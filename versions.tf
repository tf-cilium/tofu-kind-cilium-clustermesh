terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "0.5.1"
    }
    cilium = {
      source  = "littlejo/cilium"
      version = "~> 0.2.0"
    }
  }
  required_version = ">= 1.9"
}

provider "kind" {}

provider "cilium" {
  alias    = "mesh"
  for_each = toset(keys(local.clusters))
  context  = module.kind[each.key].context
}
