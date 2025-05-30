variable "description" {
  description = "The display name for the service account. Can be updated without creating a new resource."
  default     = "managed-by-terraform"
}

variable "project_id" {
  type        = string
  description = "The GCP project ID."
  default     = "terraform-461115"
}

// In variables.tf - This is for the service account's short name
variable "account_id" {
  type        = string
  description = "The unique short name (ID) for the service account to be created in sa.tf (e.g., 'terraform-sa')."
  default     = "terraform-sa" // << This is the short name
}

variable "sa_account_name" {
  type        = string
  description = "The unique short name for the service account to be created (e.g., 'my-service-account')."
  default     = "jf-webapp-dev"
}

variable "roles" {
  type        = list(string)
  description = "A list of IAM roles."
  default     = ["roles/storage.admin"]
}