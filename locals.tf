locals {
  common_tags = {
    environment = var.environment
    owner       = var.owner
    ceco        = var.ceco
    project     = var.project_name
  }
}
