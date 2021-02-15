// Output the subnet IDs for the VMs

output "frontend_subnet_id" {
    value = azurerm_subnet.frontend.id
}

output "backend_subnet_id" {
    value = azurerm_subnet.backend.id
}
