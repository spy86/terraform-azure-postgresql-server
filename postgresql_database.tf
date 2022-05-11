resource "azurerm_postgresql_database" "main" {
  for_each = {
    for k, v in "${var.database_name}" : k => v
    if "${var.database_enabled}"
  }
  name                = each.value
  resource_group_name = "${data.azurerm_resource_group.rg.name}"
  server_name         = "${var.environment}-${var.postgresql_name}-${var.region}-psql"
  charset             = "${var.database_charset}"
  collation           = "${var.database_collation}"

depends_on = [ "azurerm_postgresql_server.main" ]
}