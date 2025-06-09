// In variables.tf - This is for the service account's short name
variable "account_id" {
  type        = string
  description = "The unique short name (ID) for the service account to be created in sa.tf (e.g., 'terraform-sa')."
  #default     = "jf-webapp-dev" // << This is the short name
}


variable "roles" {
  type        = list(string)
  description = "The roles that will be granted to the service account."
  default     = []
}

variable "project_id" {
  type        = string
  description = "The GCP project ID."
  #default = "terraform-461115"
}

variable "description" {
  description = "A display name/description for the service account."
  type        = string
  #default = "Service account managed by Terraform."
}