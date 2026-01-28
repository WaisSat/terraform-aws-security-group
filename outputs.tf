output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.this.id
}

output "module_author" {
  description = "The engineer who developed this module"
  value       = local.author
}
