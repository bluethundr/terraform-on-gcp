# output.tf from vm-from-tf directory
output "email" {
  value       = data.terraform_remote_state.sa_state.outputs.email # Correctly references remote state's output 'email'
  description = "The e-mail address of the service account from sa-from-tf module."
}
output "name" {
  value       = data.terraform_remote_state.sa_state.outputs.name # Correctly references remote state's output 'name'
  description = "The fully-qualified name of the service account from sa-from-tf module."
}
output "unique_id" {
  value       = data.terraform_remote_state.sa_state.outputs.unique_id # Correctly references remote state's output 'unique_id'
  description = "The unique id of the service account from sa-from-tf module."
}