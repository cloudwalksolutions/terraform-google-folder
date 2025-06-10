output "folder_id" {
  value = module.folders.id
}

output "projects_map" {
  value = module.projects
}

output "folder_admin" {
  value = local.sa_email
}
