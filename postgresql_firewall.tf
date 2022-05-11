resource "azurerm_postgresql_firewall_rule" "main" {
  for_each = "${var.firewall_rules}"
  name                = each.value["name"]
  resource_group_name = "${data.azurerm_resource_group.rg.name}"
  server_name         = "${var.environment}-${var.postgresql_name}-${var.region}-psql"
  start_ip_address    = each.value["start_ip"]
  end_ip_address      = each.value["end_ip"]

depends_on = [ "azurerm_postgresql_server.main" ]
}