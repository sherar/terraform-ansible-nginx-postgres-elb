output "security_group_id" {
  description = "The ID of the ELB security group to attach the the LC/ASG/EC2 instance in order to be accessable by the ELB."
  value       = aws_security_group.lb.id
}

output "target_group_arn" {
  description = "The ALB target group arn"
  value       = aws_lb_target_group.lb.arn
}

output "name" {
  description = "The name of the ELB"
  value       = aws_lb.lb.name
}

output "fqdn" {
  description = "The auto-generated FQDN of the ELB."
  value       = aws_lb.lb.dns_name
}