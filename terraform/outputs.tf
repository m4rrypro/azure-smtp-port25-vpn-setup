output "vpn_gateway_public_ip" {
  value = azurerm_virtual_network_gateway.vpn_gateway.public_ip_address
}
