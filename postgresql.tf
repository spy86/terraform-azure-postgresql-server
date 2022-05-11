resource "azurerm_postgresql_server" "main" {
  name                = "${var.environment}-${var.postgresql_name}-${var.region}-psql"
  location            = "${data.azurerm_resource_group.rg.location}"
  resource_group_name = "${data.azurerm_resource_group.rg.name}"

  administrator_login          = "${var.postgresql_administrator_login}"
  administrator_login_password = "${var.postgresql_administrator_login_password}!"

  sku_name   = "${var.postgresql_sku_name}"
  version    = "${var.postgresql_version}"
  storage_mb = "${var.postgresql_storage_mb}"

  backup_retention_days        = "${var.postgresql_backup_retention_days}"
  geo_redundant_backup_enabled = "${var.postgresql_geo_redundant_backup_enabled}"
  auto_grow_enabled            = "${var.postgresql_auto_grow_enabled}"

  public_network_access_enabled    = "${var.postgresql_public_network_access_enabled}"
  ssl_enforcement_enabled          = "${var.postgresql_ssl_enforcement_enabled}"
  ssl_minimal_tls_version_enforced = "${var.postgresql_ssl_minimal_tls_version_enforced}"

  tags = "${var.default_tags}"
}