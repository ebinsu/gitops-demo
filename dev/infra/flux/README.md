terraform init  "-backend-config=..\backend.hcl"

terraform import github_repository.this  gitops-demo

terraform plan "-out=plan.tfplan" -var-file=".secrets.tfvars"

terraform destroy "-target=flux_bootstrap_git.this"