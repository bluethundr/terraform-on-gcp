# output.tf from sa-from-tf directory (RESTORED TO CORRECT STATE)

output "email" {
  value       = google_service_account.sa.email # <-- This module defines 'sa', so it references it directly
  description = "The e-mail address of the service account."
}
output "name" {
  value       = google_service_account.sa.name  # <-- Direct reference
  description = "The fully-qualified name of the service account."
}
# output "account_id"  # This line was commented out in your original, keep it that way.
output "unique_id" {
  value       = google_service_account.sa.unique_id # <-- Direct reference
  description = "The unique id of the service account."
}

