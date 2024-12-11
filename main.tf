locals {
  clusters = {
    for i in range(1, var.clusters_number + 1) : "mesh${i}" => {
      name           = "${var.cluster_name_prefix}${i}"
      pod_subnet     = cidrsubnet(var.pod_base, 8, i)
      service_subnet = cidrsubnet(var.service_base, 8, i)
      cluster_id     = i
    }
  }
}

module "kind" {
  source = "./modules/kind"

  for_each       = local.clusters
  name           = each.value.name
  pod_subnet     = each.value.pod_subnet
  service_subnet = each.value.service_subnet
  nodes_number   = var.nodes_number
}

module "cilium_clustermesh" {
  source          = "./modules/cilium-clustermesh"
  for_each        = local.clusters
  cluster_name    = each.value.name
  cluster_id      = each.value.cluster_id
  release_version = var.cilium.version
  service_type    = var.cilium.clustermesh.service_type

  providers = {
    cilium = cilium.mesh[each.key]
  }

  depends_on = [module.kind]
}

resource "cilium_clustermesh_connection" "this" {
  connection_mode      = "mesh"
  destination_contexts = [for key, value in local.clusters : "kind-${value.name}" if key != "mesh1"]
  provider             = cilium.mesh["mesh1"]
  depends_on = [
    module.cilium_clustermesh,
  ]
}
