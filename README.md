<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_postgresql_database.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.3.0/docs/resources/postgresql_database) | resource |
| [azurerm_postgresql_firewall_rule.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.3.0/docs/resources/postgresql_firewall_rule) | resource |
| [azurerm_postgresql_server.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.3.0/docs/resources/postgresql_server) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.3.0/docs/data-sources/client_config) | data source |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/3.3.0/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_database_charset"></a> [database\_charset](#input\_database\_charset) | Specifies the Charset for the PostgreSQL Database, which needs to be a valid PostgreSQL Charset. Changing this forces a new resource to be created. | `string` | `"UTF8"` | no |
| <a name="input_database_collation"></a> [database\_collation](#input\_database\_collation) | Specifies the Collation for the PostgreSQL Database, which needs to be a valid PostgreSQL Collation. Note that Microsoft uses different notation - en-US instead of en\_US. Changing this forces a new resource to be created. | `string` | `"English_United States.1252"` | no |
| <a name="input_database_enabled"></a> [database\_enabled](#input\_database\_enabled) | Defines whether the PostgreSQL Server should be empty or whether databases should be created | `string` | `"false"` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | The name of the Databases which should be created within the PostgreSQL Server. | `set(string)` | n/a | yes |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | A mapping of tags to assign to the resource. | `map` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Var used for backend container name key | `string` | `"dev"` | no |
| <a name="input_firewall_rule_prefix"></a> [firewall\_rule\_prefix](#input\_firewall\_rule\_prefix) | Specifies prefix for firewall rule names. | `string` | `"firewall-rule-"` | no |
| <a name="input_firewall_rules"></a> [firewall\_rules](#input\_firewall\_rules) | Manages a Firewall Rule for a PostgreSQL Server. The list of maps, describing firewall rules. Valid map items: name, start\_ip, end\_ip. | `list(map(string))` | `[]` | no |
| <a name="input_postgresql_administrator_login"></a> [postgresql\_administrator\_login](#input\_postgresql\_administrator\_login) | The Administrator login for the PostgreSQL Server. Required when create\_mode is Default. Changing this forces a new resource to be created. | `string` | `"postgreadm"` | no |
| <a name="input_postgresql_administrator_login_password"></a> [postgresql\_administrator\_login\_password](#input\_postgresql\_administrator\_login\_password) | The Password associated with the administrator\_login for the PostgreSQL Server. Required when create\_mode is Default. | `string` | n/a | yes |
| <a name="input_postgresql_auto_grow_enabled"></a> [postgresql\_auto\_grow\_enabled](#input\_postgresql\_auto\_grow\_enabled) | Enable/Disable auto-growing of the storage. Storage auto-grow prevents your server from running out of storage and becoming read-only. If storage auto grow is enabled, the storage automatically grows without impacting the workload. The default value if not explicitly specified is true. | `string` | `"true"` | no |
| <a name="input_postgresql_backup_retention_days"></a> [postgresql\_backup\_retention\_days](#input\_postgresql\_backup\_retention\_days) | Backup retention days for the server, supported values are between 7 and 35 days. | `number` | `"7"` | no |
| <a name="input_postgresql_geo_redundant_backup_enabled"></a> [postgresql\_geo\_redundant\_backup\_enabled](#input\_postgresql\_geo\_redundant\_backup\_enabled) | Turn Geo-redundant server backups on/off. This allows you to choose between locally redundant or geo-redundant backup storage in the General Purpose and Memory Optimized tiers. When the backups are stored in geo-redundant backup storage, they are not only stored within the region in which your server is hosted, but are also replicated to a paired data center. This provides better protection and ability to restore your server in a different region in the event of a disaster. This is not support for the Basic tier. Changing this forces a new resource to be created. | `string` | `"false"` | no |
| <a name="input_postgresql_name"></a> [postgresql\_name](#input\_postgresql\_name) | Specifies the name of the PostgreSQL Server. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_postgresql_public_network_access_enabled"></a> [postgresql\_public\_network\_access\_enabled](#input\_postgresql\_public\_network\_access\_enabled) | Whether or not public network access is allowed for this server. Defaults to true. | `string` | `"false"` | no |
| <a name="input_postgresql_sku_name"></a> [postgresql\_sku\_name](#input\_postgresql\_sku\_name) | Specifies the SKU Name for this PostgreSQL Server. The name of the SKU, follows the tier + family + cores pattern (e.g. B\_Gen4\_1, GP\_Gen5\_8) | `string` | `"GP_Gen5_4"` | no |
| <a name="input_postgresql_ssl_enforcement_enabled"></a> [postgresql\_ssl\_enforcement\_enabled](#input\_postgresql\_ssl\_enforcement\_enabled) | Specifies if SSL should be enforced on connections. Possible values are true and false. | `string` | `"true"` | no |
| <a name="input_postgresql_ssl_minimal_tls_version_enforced"></a> [postgresql\_ssl\_minimal\_tls\_version\_enforced](#input\_postgresql\_ssl\_minimal\_tls\_version\_enforced) | The minimum TLS version to support on the sever. Possible values are TLSEnforcementDisabled, TLS1\_0, TLS1\_1, and TLS1\_2. Defaults to TLSEnforcementDisabled. | `string` | `"TLS1_2"` | no |
| <a name="input_postgresql_storage_mb"></a> [postgresql\_storage\_mb](#input\_postgresql\_storage\_mb) | Max storage allowed for a server. Possible values are between 5120 MB(5GB) and 1048576 MB(1TB) for the Basic SKU and between 5120 MB(5GB) and 16777216 MB(16TB) for General Purpose/Memory Optimized SKUs. | `number` | `"102400"` | no |
| <a name="input_postgresql_version"></a> [postgresql\_version](#input\_postgresql\_version) | Specifies the version of PostgreSQL to use. Valid values are 9.5, 9.6, 10, 10.0, and 11. Changing this forces a new resource to be created. | `string` | `"9.6"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region in which resources are deployed | `string` | `"weu"` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The location/region where the postgresql server is created. Changing this forces a new resource to be created. | `string` | `"West Europe"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the postgresql server. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | The ID of the PostgreSQL Server. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the PostgreSQL Server. |
<!-- END_TF_DOCS -->


## How to use

```
provider "azurerm" {
features {}
}

module "postgresql-server" {
  source  = "spy86/postgresql-server/azure"
  version = "1.0.2"
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