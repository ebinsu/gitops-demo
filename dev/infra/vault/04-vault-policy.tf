resource "vault_policy" "team-a" {
  name = "team-a"

  policy = <<EOT
path "kv/data/db-pass" {
  capabilities = ["read"]
}
EOT
}