variable "vault_token" {
  type      = string
  sensitive = true
}

variable "kube_host" {
  type      = string
  sensitive = true
}

variable "kube_client_certificate" {
  type      = string
  sensitive = true
}

variable "kube_client_key" {
  type      = string
  sensitive = true
}

variable "kube_cluster_ca_certificate" {
  type      = string
  sensitive = true
}

variable "github-token" {
  type      = string
  sensitive = true
}