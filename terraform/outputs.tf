output "smtp_server_ip" {
  description = "Public IP address of the SMTP server"
  value       = digitalocean_droplet.smtp_server.ipv4_address
}

output "tailscale_ip" {
  description = "Tailscale private IP address (check Tailscale dashboard)"
  value       = "Check Tailscale admin console for this IP."
}
