variable "digitalocean_token" {
  description = "DigitalOcean API Token"
  type        = string
}

variable "tailscale_auth_key" {
  description = "Tailscale Auth Key"
  type        = string
}

variable "server_name" {
  description = "Name of the SMTP server"
  type        = string
  default     = "smtp-server"
}

variable "region" {
  description = "Region for the server"
  type        = string
  default     = "nyc3"
}

variable "ssh_key_id" {
  description = "SSH Key ID for accessing the server"
  type        = string
}
