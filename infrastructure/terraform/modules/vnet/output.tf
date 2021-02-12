// Output the subnet IDs for the VMs

output "public_subnet_id" {
    value = azurerm_subnet.public.id
}

output "public_subnet_id" {
    value = azurerm_subnet.private.id
}
