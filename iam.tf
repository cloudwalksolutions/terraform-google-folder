

module "folder_service_account" {
  count = var.create_service_account ? 1 : 0

  source = "terraform-google-modules/service-accounts/google"

  project_id  = var.sa_project
  names       = [local.sa_name]
  description = "${var.folder_name} folder admin service account"

}


module "organization_iam_bindings" {
  count = var.create_service_account ? 1 : 0

  source = "terraform-google-modules/iam/google//modules/organizations_iam"

  organizations = [var.org_id]
  bindings = {
    "roles/billing.user" = [
      "serviceAccount:${local.sa_email}",
    ]
    "roles/iam.securityAdmin" = var.sa_is_security_admin ? [
      "serviceAccount:${local.sa_email}",
    ] : []
  }

  depends_on = [
    module.folder_service_account,
  ]
}



