output "security_group_id" {
  description = "The ID of the Web Server security group"
  value       = aws_security_group.web_server.id
}