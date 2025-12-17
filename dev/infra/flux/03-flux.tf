## repo must not be empty; token must had admin permission;
resource "github_repository" "this" {
  name = var.github_repository
  lifecycle {
    prevent_destroy = true
  }
}

resource "flux_bootstrap_git" "this" {
  depends_on         = [github_repository.this]
  path               = "dev/apps"
  embedded_manifests = true
  components_extra   = ["image-reflector-controller", "image-automation-controller"]
}
