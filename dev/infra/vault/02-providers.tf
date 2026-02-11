provider "vault" {
  address = "http://vault.master.com"
  token   = var.vault_token
}

# ephemeral "vault_kv_secret_v2" "flux_secret" {
#   mount = "kv"
#   name  = "flux_secret"
# }