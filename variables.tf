variable "clusters_number" {
  default = 3
}

variable "nodes_number" {
  default = 2
}

variable "cluster_name_prefix" {
  default = "clustermesh"
}

variable "pod_base" {
  default = "10.0.0.0/8"
}

variable "service_base" {
  default = "172.20.0.0/16"
}

variable "cilium" {
  default = {
    version = "1.16.4"
    clustermesh = {
      service_type = "NodePort"
    }
  }
}
