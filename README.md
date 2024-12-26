
# Terraform Module: SMTP Server with Tailscale

This Terraform module deploys an SMTP server with Tailscale VPN on DigitalOcean. The server allows secure SMTP traffic on port 25 via Tailscale's private network, making it accessible for Azure or any other connected services.

## Features
- Deploys an Ubuntu-based server.
- Installs and configures Tailscale for secure access.
- Sets up Postfix SMTP server.
- Configures UFW (firewall) to allow SMTP traffic on port 25.

## Prerequisites
Before using this module, ensure you have:
- A [DigitalOcean](https://digitalocean.com) account.
- A DigitalOcean API token.
- An SSH key added to your DigitalOcean account.
- A [Tailscale](https://tailscale.com) account with a valid Tailscale auth key.

## Usage

### Deploy with Terraform
Here’s an example of how to use this module in your Terraform project:

```hcl
module "smtp_tailscale_server" {
  source             = "github.com/yourusername/smtp-tailscale-module"
  digitalocean_token = "your_digitalocean_token"
  tailscale_auth_key = "your_tailscale_auth_key"
  ssh_key_id         = "your_ssh_key_id"
  region             = "nyc3"
  server_name        = "smtp-server"
}
```

### Required Inputs
| Name                | Description                                   | Example                      |
|---------------------|-----------------------------------------------|------------------------------|
| `digitalocean_token`| Your DigitalOcean API token                  | `do_123abc456def`            |
| `tailscale_auth_key`| Your Tailscale authentication key            | `tskey-auth-ABC123XYZ`       |
| `ssh_key_id`        | Your SSH key ID from DigitalOcean            | `123456`                     |
| `region`            | DigitalOcean region for the server           | `nyc3`                       |
| `server_name`       | Name for the SMTP server                     | `smtp-server`                |

### Outputs
- `smtp_server_ip`: Public IP address of the deployed server.
- `tailscale_ip`: Private Tailscale IP address (check your Tailscale admin dashboard).

## Connecting from Azure
1. **Install Tailscale on Azure Resources:**
   - Follow [Tailscale's installation guide](https://tailscale.com/kb/1062/install) to install Tailscale on your Azure VMs or applications.
   - Use the provided Tailscale auth key to join the private Tailscale network.

2. **Configure SMTP:**
   - Update your application’s SMTP configuration to use the Tailscale private IP of the SMTP server.
   - Example configuration:
     ```plaintext
     SMTP Server: <tailscale_ip>
     SMTP Port: 25
     Username: [Your SMTP username]
     Password: [Your SMTP password]
     ```

3. **Test the Setup:**
   - Use tools like Telnet or Swaks to test SMTP connectivity:
     ```bash
     telnet <tailscale_ip> 25
     ```

## Security
- **Tailscale:** Ensures secure, encrypted communication between the SMTP server and connected clients.
- **UFW:** Only allows necessary traffic on ports 25 (SMTP) and 1194 (for Tailscale).

## License
This module is released under the [MIT License](LICENSE).

## Support
If you have any questions or need assistance, feel free to:
- Open an issue in this repository.
- Contact me directly at [m.umair.ali200@gmail.com](mailto:m.umair.ali200@gmail.com).

---

Happy Terraforming!