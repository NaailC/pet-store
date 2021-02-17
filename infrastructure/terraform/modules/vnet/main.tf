// Virtual Network

resource "azurerm_virtual_network" "main" {
  name                = "${var.project_name}-vnet"
  location            = var.location
  resource_group_name = var.resource_group
  address_space       = ["10.0.0.0/8"]
}

// Frontend Subnet with NSG allowing SSH from everywhere

resource "azurerm_subnet" "frontend" {
  name                 = "${var.resource_group}-frontend-subnet"
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefix       = "10.0.1.0/16."
}

resource "azurerm_network_security_group" "frontend" {
  name                = "${var.project_name}-frontend-nsg"
  location            = var.location
  resource_group_name = var.resource_group

  security_rule {
    name                       = "AllowSSH"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

// Backend Subnet with NSG allowing SSH only from public subnet

resource "azurerm_subnet" "backend" {
  name                 = "${var.resource_group}-backend-subnet"
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefix       = "10.0.2.0/16."
}

resource "azurerm_network_security_group" "backend" {
  name                = "${var.project_name}-backend-nsg"
  location            = var.location
  resource_group_name = var.resource_group

  security_rule {
    name                       = "AllowSSH"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "10.0.2.0/16."
    destination_address_prefix = "*"
  }
}