output "id" {
  description = "The ID of the PostgreSQL Server."
  value = "${azurerm_postgresql_server.main.id}"
  sensitive = false
}
output "fqdn" {
  description = "The ID of the PostgreSQL Server."
  value = "${azurerm_postgresql_server.main.fqdn}"
  sensitive = false
}