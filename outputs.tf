output "workspace" {
  description = "The workspace"
  value       = aws_workspaces_workspace.main
}

output "directory" {
  description = "The directory"
  value       = aws_workspaces_directory.main
}
