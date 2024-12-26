provider "digitalocean" {
  token = var.digitalocean_token
}

resource "digitalocean_droplet" "smtp_server" {
  image  = "ubuntu-20-04-x64"
  name   = var.server_name
  region = var.region
  size   = "s-1vcpu-1gb"
  ssh_keys = [var.ssh_key_id]

  # Install Tailscale and Postfix
  user_data = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y curl postfix ufw

    # Install Tailscale
    curl -fsSL https://tailscale.com/install.sh | sh
    tailscale up --authkey=${var.tailscale_auth_key}

    # Configure UFW to allow SMTP traffic
    ufw allow 25
    ufw --force enable

    echo "Tailscale and Postfix are installed. Configure as needed."
  EOF
}

output "smtp_server_ip" {
  value = digitalocean_droplet.smtp_server.ipv4_address
}

output "tailscale_ip" {
  value = "Check your Tailscale dashboard for the server's private IP."
}
