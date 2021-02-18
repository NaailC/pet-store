resource "azurerm_sql_server" "sql" {
  name                         = "petclinic-mysql-server"
  resource_group_name          = var.resource_group
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.spring_login
  administrator_login_password = var.spring_password
}