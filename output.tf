output "load_balancer_fqdn" {
  description = "The auto-generated FQDN of the Application Load Balancer."
  value       = module.lb.fqdn
}