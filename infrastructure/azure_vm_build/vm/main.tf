// frontend VM

resource "azurerm_frontend_ip" "frontend" {
  name                = "${var.project_name}-frontendip"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  allocation_method   = "Dynamic"
}

resource "azurerm_linux_virtual_machine" "frontend" {
  name                = "${var.project_name}-frontend-machine"
  resource_group_name = var.resource_group
  location            = var.location
  size                = var.vm_size
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.frontend.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    frontend_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

// backend VM

resource "azurerm_backend_ip" "backend" {
  name                = "${var.project_name}-backendip"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  allocation_method   = "Dynamic"
}

resource "azurerm_linux_virtual_machine" "backend" {
  name                = "${var.project_name}-backend-machine"
  resource_group_name = var.resource_group
  location            = var.location
  size                = var.vm_size
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.backend.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    frontend_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}