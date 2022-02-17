variable "tags" {
  description = "This is to help you add tags to your cloud objects"
  type        = map(any)
  default     = null
}

variable "root_volume_encryption_enabled" {
  description = "This root volume encryption enabled"
  type        = bool
  default     = true
}

variable "user_volume_encryption_enabled" {
  description = "This user volume encryption enabled"
  type        = bool
  default     = true
}

variable "volume_encryption_key" {
  description = "key for encryption volume"
  type        = string
  default     = "alias/aws/workspaces"
  sensitive   = true
}

variable "user_name" {
  description = "name user for directory"
  type        = string
  default     = "Administrator"
}

variable "bundle_id" {
  description = "id of bunlde"
  type        = string
  default     = "wsb-clj85qzj1"
}

variable "create_directory" {
  description = "Create managed AWS AD/AD Connector"
  type        = bool
  default     = false
}

variable "directory_pass" {
  description = "password for directory"
  type        = string
  sensitive   = true
  default     = null
}

variable "directory_type" {
  description = "Type of Directory to create. Options: SimpleAD, ADConnector or MicrosoftAD"
  type        = string
  default     = null
}

variable "directory_name" {
  description = "Directory Name (DNS name)"
  type        = string
  default     = null
}

variable "directory_size" {
  description = "Directory Size. If SimpleAD or AD Connector, select either Small or Large."
  type        = string
  default     = null
}

variable "directory_edition" {
  description = "If MicrosoftAD, select either Standard or Enterprise"
  type        = string
  default     = null
}

variable "update_dhcp_options" {
  description = "Use AD DNS servers to resolve queries on VPC"
  type        = bool
  default     = true
}

variable "access_ip_group" {
  description = "value"
  type = map(string)
  default = { any = "0.0.0.0/0" }
}

variable "allow_increase_volume" {
  description = "Enable users to increase volume size"
  type = bool
  default = false
}

variable "allow_rebuild_workspace" {
  description = "Enable users to rebuild their workspace"
  type = bool
  default = false
}

variable "create_vpc" {
  description = "Enable VPC creation"
  type = bool
  default = false
}

variable "vpc_id" {
  description = "Existing VPC ID to use"
  type = string
  default = null
}

variable "existing_directory_id" {
  description = "Existing Directory ID to use with workspace"
  type = string
  default = null
}

variable "compute_type_name" {
  description = "Compute type name to use for workspace"
  type = string
  default = "VALUE"
}

variable "user_volume_size_gib" {
  description = "User volume size in gib"
  type = number
  default = 10
}

variable "root_volume_size_gib" {
  description = "Root volume size in gib"
  type = number
  default = 80
}

variable "running_mode" {
  description = "Workspace running mode"
  type = string
  default = "AUTO_STOP"
}

variable "running_mode_timeout_min" {
  description = "Number of minutes until a workspace is automatically stopped"
  type = number
  default = 60
}

variable "create_vpc_cidr" {
  description = "CIDR block to use when creating VPC"
  type = string
  default = "10.0.0.0/16"
}

variable "create_vpc_subnet_a" {
  description = "CIDR block for subnet A"
  type = string
  default = "10.0.1.0/24"
}

variable "create_vpc_subnet_b" {
  description = "CIDR block for subnet B"
  type = string
  default = "10.0.2.0/24"
}