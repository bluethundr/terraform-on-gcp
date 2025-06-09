# main.tf in the root directory (terraform-on-gcp)

# --------------------------------------------------------------------------------------------------
# TERRAFORM SETTINGS
# Defines Terraform version requirements and backend configuration
# --------------------------------------------------------------------------------------------------
terraform {
  required_version = "~> 5.4.0" # Or your desired Terraform version

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0" # Or your desired Google provider version
    }
  }

  # Configure your remote backend here.
  # This is crucial for collaborative work and state management.
  # Replace 'your-project-id' and 'your-state-bucket-name'
  backend "gcs" {
    bucket = "your-state-bucket-name" # This bucket needs to exist before terraform init
    prefix = "terraform/state"
  }
}

# --------------------------------------------------------------------------------------------------
# PROVIDER CONFIGURATION
# Configure the Google Cloud Provider
# --------------------------------------------------------------------------------------------------
provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
  zone    = var.gcp_zone # Optional, if you need a default zone
}

provider "google-beta" {
  project = var.gcp_project_id
  region  = var.gcp_region
  zone    = var.gcp_zone
}

# --------------------------------------------------------------------------------------------------
# ROOT MODULE VARIABLES
# Define variables specific to the root module, often for provider settings
# --------------------------------------------------------------------------------------------------
variable "gcp_project_id" {
  description = "The GCP project ID to deploy resources into."
  type        = string
}

variable "gcp_region" {
  description = "The GCP region to deploy regional resources into."
  type        = string
  default     = "us-central1" # Example default
}

variable "gcp_zone" {
  description = "The GCP zone to deploy zonal resources into."
  type        = string
  default     = "us-central1-a" # Example default
}

# --------------------------------------------------------------------------------------------------
# MODULE CALLS
# Call your subdirectories as modules, passing in necessary inputs
# --------------------------------------------------------------------------------------------------

# Example for your GCS State Bucket module
module "gcs_state_bucket" {
  source = "./modules/gcs-state-bucket" # Path to your module directory

  # Pass variables to the module if it has any declared in its variables.tf
  # You'll need to check the variables.tf inside modules/gcs-state-bucket/
  project_id = var.gcp_project_id
  region     = var.gcp_region
  # ... any other variables specific to your gcs-state-bucket module
}

# Example for your Service Account module
module "service_accounts" {
  source = "./modules/sa-from-tf" # Path to your module directory

  project_id = var.gcp_project_id
  # ... any other variables specific to your sa-from-tf module
}

# Example for your VM module
module "compute_instances" {
  source = "./modules/vm-from-tf" # Path to your module directory

  project_id = var.gcp_project_id
  region     = var.gcp_region
  zone       = var.gcp_zone
  # ... any other variables specific to your vm-from-tf module
}

# Add similar module blocks for `gcs-from-tf`, `mig-from-tf`, `vpc-from-tf` etc.
# Make sure to give each `module` block a unique local name (e.g., `gcs_bucket`, `migration_group`, `vpc_network`).

# --------------------------------------------------------------------------------------------------
# ROOT MODULE OUTPUTS
# Define outputs that you want to easily retrieve from your overall infrastructure
# --------------------------------------------------------------------------------------------------

output "state_bucket_name" {
  description = "The name of the Terraform state bucket."
  # This assumes your gcs-state-bucket module has an output named 'bucket_name'
  value       = module.gcs_state_bucket.bucket_name
}

output "service_account_email" {
  description = "The email of a key service account from the sa-from-tf module."
  # This assumes your sa-from-tf module has an output named 'main_sa_email'
  value       = module.service_accounts.main_sa_email
}