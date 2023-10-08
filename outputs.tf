output "id" {
  description = "The ID of created workspace"
  type        = string
  value       = tfe_workspace.self.id
}
