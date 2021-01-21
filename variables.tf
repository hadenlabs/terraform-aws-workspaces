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
  default     = "wsb-bh8rsxt14"
}

variable "create_directory" {
  description = "Create managed AWS AD/AD Connector"
  type        = bool
  default     = true
}

variable "directory_pass" {
  description = "password for directory"
  type        = string
  sensitive   = true
}

variable "directory_type" {
  description = "Type of Directory to create. Options: SimpleAD, ADConnector or MicrosoftAD"
  type        = string
  default     = "MicrosoftAD"
}

variable "directory_name" {
  description = "Directory Name (DNS name)"
  type        = string
  default     = "org.hadenlabs.com"
}

variable "directory_size" {
  description = "Directory Size. If SimpleAD or AD Connector, select either Small or Large."
  type        = string
  default     = "Small"
}

variable "directory_edition" {
  description = "If MicrosoftAD, select either Standard or Enterprise"
  type        = string
  default     = "Standard"
}

variable "update_dhcp_options" {
  description = "Use AD DNS servers to resolve queries on VPC"
  type        = bool
  default     = true
}