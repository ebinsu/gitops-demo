resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
}

resource "vault_kubernetes_auth_backend_config" "dev-cluster" {
  backend                = vault_auth_backend.kubernetes.path
  kubernetes_host        = "https://172.24.110.87:6443"
}

resource "vault_kubernetes_auth_backend_role" "team-a" {
  backend                          = vault_auth_backend.kubernetes.path
  role_name                        = "team-a"
  bound_service_account_names      = ["team-a"]
  bound_service_account_namespaces = ["team-a"]
  token_ttl                        = 3600
  token_policies                   = ["team-a"]
}
