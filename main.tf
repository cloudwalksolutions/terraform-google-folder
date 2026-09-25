
# The folder grants the admin nothing, because that account lives in a project inside this
# folder — folder, then project, then account — so a grant made here always names one that does
# not exist yet. `folder_iam_bindings` makes it once the account is real.
module "folders" {
  source = "terraform-google-modules/folders/google"

  parent = var.parent_folder_id
  names  = [var.folder_name]

  deletion_protection = var.deletion_protection
}


module "projects" {
  for_each = var.projects_dict

  source = "git::https://github.com/cloudwalksolutions/terraform-google-project.git?ref=0.0.3"

  billing_account = var.billing_account
  lifecycle_name  = var.lifecycle_name
  folder_name     = var.folder_name
  use_random_id   = var.use_random_id
  use_folder_name = var.use_folder_name
  deletion_policy = var.deletion_policy

  folder_id       = module.folders.id
  proj_identifier = var.proj_identifier
  project_label   = each.key
  additional_apis = each.value

  depends_on = [module.folders]
}


