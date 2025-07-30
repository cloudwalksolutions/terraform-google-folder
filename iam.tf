
module "folder_service_account" {
  count = var.create_service_account ? 1 : 0

  source = "terraform-google-modules/service-accounts/google"

  project_id  = var.sa_project
  names       = [local.sa_name]
  description = "${var.folder_name} folder admin service account"
}


module "organization_iam_bindings" {
  count = var.sa_is_billing_user ? 1 : 0

  source = "terraform-google-modules/iam/google//modules/organizations_iam"

  organizations = [var.org_id]
  bindings = {
    "roles/billing.user" = [
      "serviceAccount:${local.sa_email}",
    ]
    "roles/iam.securityAdmin" = [
      "serviceAccount:${local.sa_email}",
    ]
  }

  depends_on = [
    module.folder_service_account,
  ]
}


module "folder_iam_bindings" {
  count = var.add_folder_bindings ? 1 : 0

  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  folders = [module.folders.id]

  bindings = {
    for role in distinct([
      for r in concat(
        var.default_folder_permissions,
        var.extra_folder_permissions,
        var.sa_is_security_admin ? ["roles/iam.securityAdmin"] : []
      ) : startswith(r, "roles/") ? r : "roles/${r}"
    ]) : role => [
      "serviceAccount:${local.sa_email}"
    ]
  }

  depends_on = [
    module.folder_service_account,
    module.folders,
  ]
}

