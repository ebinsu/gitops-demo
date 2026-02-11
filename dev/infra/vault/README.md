terraform init  "-backend-config=..\backend.hcl"

terraform plan "-out=plan.tfplan" -var-file=".secrets.tfvars"