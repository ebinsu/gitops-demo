provider "vault" {
  address = "http://vault.master.com"
  token   = var.vault_token
}

ephemeral "vault_kv_secret_v2" "flux_secret" {
  mount = "kv"
  name  = "flux_secret"
}

provider "flux" {
  kubernetes = {
    host                   = ephemeral.vault_kv_secret_v2.flux_secret.data["kube_host"]
    client_certificate     = base64decode(ephemeral.vault_kv_secret_v2.flux_secret.data["kube_client_certificate"])
    client_key             = base64decode(ephemeral.vault_kv_secret_v2.flux_secret.data["kube_client_key"])
    cluster_ca_certificate = base64decode(ephemeral.vault_kv_secret_v2.flux_secret.data["kube_cluster_ca_certificate"])
  }
  git = {
    url    = "https://github.com/ebinsu/gitops-demo.git"
    branch = "main"
    http = {
      username = "git"
      password = ephemeral.vault_kv_secret_v2.flux_secret.data["token"]
    }
  }
}

provider "github" {
  owner = "ebinsu"
  token = ephemeral.vault_kv_secret_v2.flux_secret.data["token"]
}
