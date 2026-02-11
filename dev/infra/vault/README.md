~~~
terraform init  "-backend-config=..\backend.hcl"

terraform plan "-out=plan.tfplan" -var-file=".secrets.tfvars"
~~~

### vault csi flow

1. enable kubernetes auth method
~~~
vault auth enable kubernetes

vault write auth/kubernetes/config \
kubernetes_host="https://$KUBERNETES_PORT_443_TCP_ADDR:443"
~~~

2. write policy
~~~
vault policy write internal-app - <<EOF
path "secret/data/db-pass" {
  capabilities = ["read"]
}
EOF
~~~

3. create a Kubernetes authentication role
~~~
vault write auth/kubernetes/role/database \
    bound_service_account_names=webapp-sa \
    bound_service_account_namespaces=default \
    policies=internal-app \
    ttl=20m
~~~

1 & 3 = [03-kubernetes_auth_backend.tf](03-kubernetes_auth_backend.tf)

2     = [04-vault-policy.tf](04-vault-policy.tf)

[doc](https://developer.hashicorp.com/vault/tutorials/kubernetes-introduction/kubernetes-secret-store-driver?productSlug=vault&tutorialSlug=kubernetes&tutorialSlug=kubernetes-secret-store-driver)
