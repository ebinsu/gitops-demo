resource "vault_policy" "team-a" {
  name = "team-a"

  policy = <<EOT
path "kv/data/db-pass" {
  capabilities = ["read"]
}
EOT
}

resource "vault_policy" "flux" {
  name = "flux"

  policy = <<EOT
path "kv/data/flux" {
  capabilities = ["read"]
}
EOT
}