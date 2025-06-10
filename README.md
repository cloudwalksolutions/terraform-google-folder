# Terraform Module: GCP Folder

This is a Terraform module repository for creating a folder and a set of projects/apis to create underneath it. It can also create a folder admin service account if necessary

<img alt="Terraform" src="https://www.terraform.io/assets/images/logo-text-8c3ba8a6.svg" width="600px">

Documentation is available on the [Terraform website](http://www.terraform.io):

- [Intro](https://www.terraform.io/intro/index.html)
- [Docs](https://www.terraform.io/docs/index.html)

<!-- BEGIN_TF_DOCS -->
## Requirements

Uses TF Projects module

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_folder_service_account"></a> [folder\_service\_account](#module\_folder\_service\_account) | terraform-google-modules/service-accounts/google | n/a |
| <a name="module_folders"></a> [folders](#module\_folders) | terraform-google-modules/folders/google | n/a |
| <a name="module_organization_iam_bindings"></a> [organization\_iam\_bindings](#module\_organization\_iam\_bindings) | terraform-google-modules/iam/google//modules/organizations_iam | n/a |
| <a name="module_projects"></a> [projects](#module\_projects) | app.terraform.io/hudl-aml/project/google | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_service_account"></a> [create\_service\_account](#input\_create\_service\_account) | Whether or not a service account should be created with folder permissions | `bool` | `false` | no |
| <a name="input_folder_name"></a> [folder\_name](#input\_folder\_name) | Folder display name | `string` | n/a | yes |
| <a name="input_folder_permissions"></a> [folder\_permissions](#input\_folder\_permissions) | Folder permissions for service account created | `list(string)` | <pre>[<br>  "roles/iam.securityAdmin",<br>  "roles/iam.serviceAccountAdmin",<br>  "roles/resourcemanager.folderAdmin",<br>  "roles/resourcemanager.projectCreator",<br>  "roles/serviceusage.serviceUsageAdmin"<br>]</pre> | no |
| <a name="input_lifecycle_name"></a> [lifecycle\_name](#input\_lifecycle\_name) | Optional lifecycle to be added to project naming convention | `string` | `""` | no |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | GCP Organization ID | `string` | `"982255848927"` | no |
| <a name="input_parent_folder_id"></a> [parent\_folder\_id](#input\_parent\_folder\_id) | Parent folder ID | `string` | n/a | yes |
| <a name="input_projects_dict"></a> [projects\_dict](#input\_projects\_dict) | Map of project names and apis to enable for each | `map(list(string))` | `{}` | no |
| <a name="input_sa_is_security_admin"></a> [sa\_is\_security\_admin](#input\_sa\_is\_security\_admin) | Determines if folder admin SA should get security admin on the org to set billing user | `bool` | `false` | no |
| <a name="input_sa_prefix"></a> [sa\_prefix](#input\_sa\_prefix) | Service account display name | `string` | `""` | no |
| <a name="input_sa_project"></a> [sa\_project](#input\_sa\_project) | Service account project | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_folder_id"></a> [folder\_id](#output\_folder\_id) | n/a |
| <a name="output_projects_map"></a> [projects\_map](#output\_projects\_map) | n/a |
<!-- END_TF_DOCS -->