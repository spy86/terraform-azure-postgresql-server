############################
###########################
# Common vars
###########################
variable "environment" {
  description = "Var used for backend container name key"
  type = string
  default = "dev"
}
variable "default_tags" {
  description = "A mapping of tags to assign to the resource."
  type = map
}
variable "region" {
  description = "Region in which resources are deployed"
  type = string
  default = "weu"
}
###########################
# Resource groups vars
###########################
variable "resource_group_location" {
  description = "The location/region where the postgresql server is created. Changing this forces a new resource to be created."
  default = "West Europe"
  type = string
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the postgresql server."
  type = string
}
############################
#POSTGRESQL&DATABASE variable
############################
variable "postgresql_administrator_login" {
    description = "The Administrator login for the PostgreSQL Server. Required when create_mode is Default. Changing this forces a new resource to be created."
    type = string
    default = "postgreadm"
}
variable "postgresql_administrator_login_password" {
    description = "The Password associated with the administrator_login for the PostgreSQL Server. Required when create_mode is Default."
    type = string
}
variable "postgresql_sku_name" {
    description = "Specifies the SKU Name for this PostgreSQL Server. The name of the SKU, follows the tier + family + cores pattern (e.g. B_Gen4_1, GP_Gen5_8)"
    type = string
    default = "GP_Gen5_4"
}
variable "postgresql_version" {
    description = "Specifies the version of PostgreSQL to use. Valid values are 9.5, 9.6, 10, 10.0, and 11. Changing this forces a new resource to be created."
    type = string
    default = "9.6"
}
variable "postgresql_storage_mb" {
    description = "Max storage allowed for a server. Possible values are between 5120 MB(5GB) and 1048576 MB(1TB) for the Basic SKU and between 5120 MB(5GB) and 16777216 MB(16TB) for General Purpose/Memory Optimized SKUs."
    type = number
    default = "102400"
}
variable "postgresql_backup_retention_days" {
    description = "Backup retention days for the server, supported values are between 7 and 35 days."
    type = number
    default = "7"
}
variable "postgresql_geo_redundant_backup_enabled" {
    description = "Turn Geo-redundant server backups on/off. This allows you to choose between locally redundant or geo-redundant backup storage in the General Purpose and Memory Optimized tiers. When the backups are stored in geo-redundant backup storage, they are not only stored within the region in which your server is hosted, but are also replicated to a paired data center. This provides better protection and ability to restore your server in a different region in the event of a disaster. This is not support for the Basic tier. Changing this forces a new resource to be created."
    type = string
    default = "false"
}
variable "postgresql_auto_grow_enabled" {
    description = "Enable/Disable auto-growing of the storage. Storage auto-grow prevents your server from running out of storage and becoming read-only. If storage auto grow is enabled, the storage automatically grows without impacting the workload. The default value if not explicitly specified is true."
    type = string
    default = "true"
}
variable "postgresql_public_network_access_enabled" {
    description = "Whether or not public network access is allowed for this server. Defaults to true."
    type = string
    default = "false"
}
variable "postgresql_ssl_enforcement_enabled" {
    description = "Specifies if SSL should be enforced on connections. Possible values are true and false."
    type = string
    default = "true"
}
variable "postgresql_ssl_minimal_tls_version_enforced" {
    description = "The minimum TLS version to support on the sever. Possible values are TLSEnforcementDisabled, TLS1_0, TLS1_1, and TLS1_2. Defaults to TLSEnforcementDisabled."
    type = string
    default = "TLS1_2"
}
variable "postgresql_name" {
    description = "Specifies the name of the PostgreSQL Server. Changing this forces a new resource to be created."
    type = string
}
variable "database_name" {
  description = "The name of the Databases which should be created within the PostgreSQL Server."
  type        = set(string)
}
variable "database_enabled" {
  description = "Defines whether the PostgreSQL Server should be empty or whether databases should be created"
  type = string
  default = "false"
}
variable "database_charset" {
  description = "Specifies the Charset for the PostgreSQL Database, which needs to be a valid PostgreSQL Charset. Changing this forces a new resource to be created."
  type = string
  default = "UTF8"
}
variable "database_collation" {
  description = "Specifies the Collation for the PostgreSQL Database, which needs to be a valid PostgreSQL Collation. Note that Microsoft uses different notation - en-US instead of en_US. Changing this forces a new resource to be created."
  type = string
  default = "English_United States.1252"
}
variable "firewall_rules" {
  description = "Manages a Firewall Rule for a PostgreSQL Server. The list of maps, describing firewall rules. Valid map items: name, start_ip, end_ip."
  type        = list(map(string))
  default     = []
}
variable "firewall_rule_prefix" {
  description = "Specifies prefix for firewall rule names."
  type        = string
  default     = "firewall-rule-"
}