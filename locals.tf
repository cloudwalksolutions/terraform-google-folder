
locals {
  sa_prefix = var.sa_prefix != "" ? var.sa_prefix : var.folder_name
  sa_name   = var.sa_name != "" ? var.sa_name : "${local.sa_prefix}-folder-admin"

  # Read the id off the project that was created. Rebuilding the name cannot know the random
  # suffix, so it named a project that never existed.
  sa_project_id = var.sa_project_label != "" && contains(keys(module.projects), var.sa_project_label) ? module.projects[var.sa_project_label].project_id : var.sa_project

  sa_email = var.sa_email != "" ? var.sa_email : "${local.sa_name}@${local.sa_project_id}.iam.gserviceaccount.com"
}
