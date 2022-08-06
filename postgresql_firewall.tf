resource "azurerm_postgresql_firewall_rule" "main" {
  count               = length(var.firewall_rules)
  name                = format("%s%s", var.firewall_rule_prefix, lookup(var.firewall_rules[count.index], "name", count.index))
  resource_group_name = "${data.azurerm_resource_group.rg.name}"
  server_name         = "${var.environment}-${var.postgresql_name}-${var.region}-psql"
  start_ip_address    = var.firewall_rules[count.index]["start_ip"]
  end_ip_address      = var.firewall_rules[count.index]["end_ip"]

depends_on = [ azurerm_postgresql_server.main ]
}