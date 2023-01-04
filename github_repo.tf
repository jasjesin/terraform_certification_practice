resource "github_repository" "terraform_repo" {
  name = var.github.name
  visibility = var.github.visibility
}