

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


variable "sa_prefix" {
  description = "Service account display name"
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


variable "create_service_account" {
  description = "Whether or not a service account should be created with folder permissions"
  type        = bool
  default     = false
}


variable "default_folder_permissions" {
  description = "Default folder permissions for service account created"
  type        = list(string)
  default = [
    "roles/iam.securityAdmin",
    "roles/iam.serviceAccountAdmin",
    "roles/resourcemanager.folderAdmin",
    "roles/resourcemanager.projectCreator",
    "roles/serviceusage.serviceUsageAdmin",
  ]
}

variable "extra_folder_permissions" {
  description = "Additional folder permissions for service account created"
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


