locals {
  tags = {
    terraform_id = var.namespace
    Namespace    = var.namespace
    Environment  = var.stage
    Stage        = var.stage
  }
}

module "main" {
  source = "git://github.com/hadenlabs/terraform-aws-workspaces.git?ref=0.1.0"
  providers = {
    aws = aws.main
  }

  directory_pass = "implement password with sops"
  tags           = local.tags
}