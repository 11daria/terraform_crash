provider "github" {
  token = "b41*********a4f595"
  
}

resource "github_repository" "terraform" {
  name        = "terraform"
  auto_init   = true
  description = "Repository for terraform task"
}

resource "github_branch" "develop" {
  repository = "terraform"
  branch     = "develop"
  
}

resource "github_branch_protection"  "protect_branch" {
  repository_id = "github_repository.terraform.id"
#  repository = "terraform"
  pattern     = "master"
  enforce_admins = true
}

resource "github_user_ssh_key" "ssh_ke" {
  title = "my ssh key"
  key   = "/home/ubuntu/.ssh/id_rsa.pub"
}
