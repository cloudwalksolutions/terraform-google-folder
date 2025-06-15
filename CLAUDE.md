# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Module Overview

This is a Terraform module for creating Google Cloud Platform folders with optional projects and service accounts. The module creates a GCP folder under a parent folder and can optionally create projects with enabled APIs underneath it.

## Architecture

The module consists of several interconnected components:

- **Folder Creation**: Uses `terraform-google-modules/folders/google` to create the main folder
- **Project Creation**: Uses a custom CloudWalk project module to create projects within the folder
- **Service Account Management**: Optionally creates folder admin service accounts with appropriate IAM bindings
- **IAM Management**: Handles both organization-level and folder-level IAM bindings

## Key Module Dependencies

- `terraform-google-modules/folders/google` - Core folder creation
- `git::https://github.com/cloudwalksolutions/terraform-google-project.git?ref=0.0.1` - CloudWalk's custom project module
- `terraform-google-modules/service-accounts/google` - Service account creation
- `terraform-google-modules/iam/google//modules/organizations_iam` - Organization IAM
- `terraform-google-modules/iam/google//modules/folders_iam` - Folder IAM

## Common Commands

### Terraform Operations
```bash
# Initialize terraform
terraform init

# Plan changes
terraform plan

# Apply changes
terraform apply

# Validate configuration
terraform validate

# Format code
terraform fmt

# Show current state
terraform show
```

## Important Implementation Details

- Service account creation is conditional based on `create_service_account` variable
- The module uses `for_each` to create multiple projects from `projects_dict`
- IAM permissions are dynamically constructed by combining default and extra permissions
- Service account email is constructed using locals and conditional logic
- All resources have proper dependency chains using `depends_on`

## Variable Patterns

- Boolean flags control optional features (`create_service_account`, `use_folder_name`, etc.)
- Default values are provided for most optional variables
- The `projects_dict` variable uses `map(list(string))` to define projects and their APIs
- Permission lists are merged dynamically in IAM bindings

## Output Structure

The module outputs:
- `folder_id` - The created folder ID for use in other modules
- `projects_map` - Map of all created projects for reference
- `folder_admin` - Service account email when created