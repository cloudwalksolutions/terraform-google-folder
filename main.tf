
module "folders" {
  source = "terraform-google-modules/folders/google"

  parent = var.parent_folder_id
  names  = [var.folder_name]

  set_roles           = true
  deletion_protection = var.deletion_protection

  all_folder_admins = var.create_service_account ? [
    "serviceAccount:${local.sa_email}"
  ] : []

  depends_on = [module.folder_service_account.email]
}


module "projects" {
  for_each = var.projects_dict

  source = "git::https://github.com/cloudwalksolutions/terraform-google-project.git?ref=0.0.2"

  billing_account = var.billing_account
  lifecycle_name  = var.lifecycle_name
  folder_name     = var.folder_name
  use_random_id   = var.use_random_id
  use_folder_name = var.use_folder_name

  folder_id       = module.folders.id
  proj_identifier = var.proj_identifier
  project_label   = each.key
  additional_apis = each.value

  depends_on = [module.folders]
}


