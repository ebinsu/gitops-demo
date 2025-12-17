variable "github_token" {
  description = "GitHub token"
  sensitive   = true
  type        = string
  default     = ""
}

variable "github_org" {
  description = "GitHub organization"
  type        = string
  default     = "ebinsu"
}

variable "github_repository" {
  description = "GitHub repository"
  type        = string
  default     = "gitops-demo"
}

variable "kube_host" {
  type    = string
  default = ""
}

variable "kube_client_certificate" {
  type    = string
  default = ""
}

variable "kube_client_key" {
  type    = string
  default = ""
}

variable "kube_cluster_ca_certificate" {
  type    = string
  default = ""
}
