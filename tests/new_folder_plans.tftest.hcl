mock_provider "google" {}
mock_provider "random" {}

variables {
  parent_folder_id = "folders/123456789"
  folder_name      = "demo"
  org_id           = "987654321"
  billing_account  = "000000-000000-000000"
  projects_dict = {
    "cw-admin" = []
    "prod-app" = []
  }

  create_service_account = true
  sa_is_security_admin   = true
  sa_is_billing_user     = true
  sa_name                = "prod-demo-admin-ws"
  sa_project_label       = "cw-admin"
}

run "a_folder_that_does_not_exist_yet_can_be_planned" {
  command = plan

  assert {
    condition     = output.sa_project_id == "demo-cw-admin-project"
    error_message = "the admin project id was not known at plan time"
  }

  assert {
    condition     = output.folder_admin == "prod-demo-admin-ws@demo-cw-admin-project.iam.gserviceaccount.com"
    error_message = "the folder admin's email was not known at plan time, so its IAM grants cannot be keyed"
  }
}
