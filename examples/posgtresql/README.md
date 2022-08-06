## How to use

```
provider "azurerm" {
features {}
}

module "postgresql-server" {
  source  = "spy86/postgresql-server/azure"
  version = "1.0.3"
  database_name = ["database01", "database02"]
  postgresql_administrator_login_password = "P@ssw0rd_123"
  postgresql_name = "640e409e"
  resource_group_name = "eus-test-rg"
  resource_group_location = "East US"
  database_charset = "UTF8"
  database_collation = "English_United States.1252"
  database_enabled = "true"
  environment= "dev"
  firewall_rule_prefix = "firewall-rule-"
  firewall_rules = [
    { name = "rule01", start_ip = "10.0.0.5", end_ip = "10.0.0.8" },
    { start_ip = "127.0.0.0", end_ip = "127.0.1.0" },
  ]
  postgresql_administrator_login = "postgreadm"
  postgresql_auto_grow_enabled = "true"
  postgresql_backup_retention_days = "7"
  postgresql_geo_redundant_backup_enabled = "false"
  postgresql_public_network_access_enabled= "true"
  postgresql_sku_name = "GP_Gen5_4"
  postgresql_ssl_enforcement_enabled = "true"
  postgresql_ssl_minimal_tls_version_enforced = "TLS1_2"
  postgresql_storage_mb = "102400"
  postgresql_version = "9.6"
  region= "eus"

  default_tags = {
      Administrator = "Someone"
      Department = "IT"
      CostCentre = "ABC123"
      ContactPerson = "Someone@example.com"
      ManagedByTerraform = "True"
}
}
```