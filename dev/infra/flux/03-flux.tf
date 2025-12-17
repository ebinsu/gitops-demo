## repo must not be empty; token must had admin permission;
## terraform import github_repository.this  gitops-demo
resource "github_repository" "this" {
  name = var.github_repository
  lifecycle {
    prevent_destroy = true
  }
}

# terraform destroy "-target=flux_bootstrap_git.this"
resource "flux_bootstrap_git" "this" {
  depends_on         = [github_repository.this]
  path               = "dev/apps"
  embedded_manifests = true
  components_extra   = ["image-reflector-controller", "image-automation-controller"]
}
