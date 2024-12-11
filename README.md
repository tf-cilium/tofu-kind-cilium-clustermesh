<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9 |
| <a name="requirement_cilium"></a> [cilium](#requirement\_cilium) | ~> 0.2.0 |
| <a name="requirement_kind"></a> [kind](#requirement\_kind) | 0.7.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cilium.mesh"></a> [cilium.mesh](#provider\_cilium.mesh) | 0.2.14 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cilium_clustermesh"></a> [cilium\_clustermesh](#module\_cilium\_clustermesh) | ./modules/cilium-clustermesh | n/a |
| <a name="module_kind"></a> [kind](#module\_kind) | ./modules/kind | n/a |

## Resources

| Name | Type |
|------|------|
| [cilium_clustermesh_connection.this](https://registry.terraform.io/providers/littlejo/cilium/latest/docs/resources/clustermesh_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cilium"></a> [cilium](#input\_cilium) | n/a | `map` | <pre>{<br>  "clustermesh": {<br>    "service_type": "NodePort"<br>  },<br>  "version": "1.16.4"<br>}</pre> | no |
| <a name="input_cluster_name_prefix"></a> [cluster\_name\_prefix](#input\_cluster\_name\_prefix) | n/a | `string` | `"clustermesh"` | no |
| <a name="input_clusters_number"></a> [clusters\_number](#input\_clusters\_number) | n/a | `number` | `3` | no |
| <a name="input_nodes_number"></a> [nodes\_number](#input\_nodes\_number) | n/a | `number` | `2` | no |
| <a name="input_pod_base"></a> [pod\_base](#input\_pod\_base) | n/a | `string` | `"10.0.0.0/8"` | no |
| <a name="input_service_base"></a> [service\_base](#input\_service\_base) | n/a | `string` | `"172.20.0.0/16"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
