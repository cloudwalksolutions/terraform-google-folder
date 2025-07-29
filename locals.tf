
locals {
  sa_prefix = var.sa_prefix != "" ? var.sa_prefix : var.folder_name
  sa_name   = var.sa_name != "" ? var.sa_name : "${local.sa_prefix}-folder-admin"
  sa_email  = var.create_service_account ? "${local.sa_name}@${var.sa_project}.iam.gserviceaccount.com" : ""


}
