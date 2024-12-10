module "kind" {
  source = "./modules/kind"

  for_each       = var.kind
  name           = each.value.name
  pod_subnet     = each.value.pod_subnet
  service_subnet = each.value.service_subnet
  nodes_number   = 1
}

module "cilium_clustermesh" {
  source          = "./modules/cilium-clustermesh"
  for_each        = var.kind
  cluster_name    = each.value.name
  cluster_id      = each.value.cilium.cluster_id
  release_version = each.value.cilium.version
  service_type    = "NodePort"

  providers = {
    cilium = cilium.mesh[each.key]
  }

  depends_on = [module.kind]
}

resource "cilium_clustermesh_connection" "this" {
  destination_contexts = ["kind-${var.kind.mesh2.name}"]
  provider             = cilium.mesh["mesh1"]
  depends_on = [
    module.cilium_clustermesh,
  ]
}
