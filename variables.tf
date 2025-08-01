

variable "org_id" {
  description = "GCP org ID"
  type        = string
  default     = ""
}


variable "parent_folder_id" {
  description = "Parent folder ID"
  type        = string
}


variable "folder_name" {
  description = "Folder display name"
  type        = string
}


variable "billing_account" {
  description = "Billing account ID"
  type        = string
  default     = ""
}


variable "proj_identifier" {
  description = "Optional project set identifier"
  type        = string
  default     = ""
}


variable "lifecycle_name" {
  description = "Optional lifecycle to be added to project naming convention"
  type        = string
  default     = ""
}


variable "sa_project" {
  description = "Service account project"
  type        = string
  default     = ""
}


variable "sa_email" {
  description = "Service account email. If set, overrides sa_prefix and sa_name"
  type        = string
  default     = ""
}


variable "sa_prefix" {
  description = "Service account display name prefix"
  type        = string
  default     = ""
}


variable "sa_name" {
  description = "Service account display name. Overrides sa_prefix if set"
  type        = string
  default     = ""
}


variable "use_folder_name" {
  description = "Whether folder name should be used in the project ID"
  type        = bool
  default     = true
}


variable "sa_is_security_admin" {
  description = "Determines if folder admin SA should get security admin on the org to set billing user"
  type        = bool
  default     = false
}


variable "sa_is_billing_user" {
  description = "Determines if folder admin SA should get billing user on the org to set billing account"
  type        = bool
  default     = false
}


variable "create_service_account" {
  description = "Whether or not a service account should be created with folder permissions"
  type        = bool
  default     = false
}


variable "add_folder_bindings" {
  description = "Whether to enable folder IAM bindings for the service account"
  type        = bool
  default     = true
}


variable "default_folder_permissions" {
  description = "Default folder permissions for service account created. Each permission will be prepended with 'roles/'"
  type        = list(string)
  default = [
    "iam.securityAdmin",
    "iam.serviceAccountUser",
    "iam.serviceAccountAdmin",
    "resourcemanager.folderCreator",
    "resourcemanager.folderAdmin",
    "resourcemanager.projectCreator",
    "resourcemanager.projectDeleter",
    "resourcemanager.projectIamAdmin",
    "serviceusage.serviceUsageAdmin",
  ]
}

variable "extra_folder_permissions" {
  description = "Additional folder permissions for service account created. Each permission will be prepended with 'roles/'"
  type        = list(string)
  default     = []
}

variable "projects_dict" {
  description = "Map of project names and apis to enable for each"
  type        = map(list(string))
  default     = {}
}


variable "use_random_id" {
  description = "Whether projects should have random string appended"
  type        = bool
  default     = false
}


variable "deletion_protection" {
  description = "Whether to enable deletion protection on the folder"
  type        = bool
  default     = false
}


