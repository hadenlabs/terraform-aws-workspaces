locals {
  tags = null
  region_workspaces_az_id_strings = {
    "us-east-1" = join(",", formatlist("use1-az%d", tolist(["2", "4", "6"])))
  }

  workspaces_az_id_strings = lookup(local.region_workspaces_az_id_strings, data.aws_region.current.name, join(",", data.aws_availability_zones.available.zone_ids))
  workspaces_az_ids        = split(",", local.workspaces_az_id_strings)
}

resource "aws_workspaces_directory" "main" {
  count        = var.create_directory ? 1 : 0
  directory_id = aws_directory_service_directory.main[0].id

  subnet_ids = [
    aws_subnet.private_a[0].id,
    aws_subnet.private_b[0].id,
  ]

  self_service_permissions {
    increase_volume_size = var.allow_increase_volume
    rebuild_workspace    = var.allow_rebuild_workspace
  }

  depends_on = [
    aws_iam_role.main,
  ]
}

resource "aws_workspaces_workspace" "main" {
  directory_id = var.create_directory ? aws_directory_service_directory.main[0].id : var.existing_directory_id
  bundle_id    = data.aws_workspaces_bundle.bundle.id
  user_name    = var.user_name

  root_volume_encryption_enabled = var.root_volume_encryption_enabled
  user_volume_encryption_enabled = var.user_volume_encryption_enabled
  volume_encryption_key          = var.root_volume_encryption_enabled || var.user_volume_encryption_enabled ? var.volume_encryption_key : null

  workspace_properties {
    compute_type_name                         = var.compute_type_name
    user_volume_size_gib                      = var.user_volume_size_gib
    root_volume_size_gib                      = var.root_volume_size_gib
    running_mode                              = var.running_mode
    running_mode_auto_stop_timeout_in_minutes = var.running_mode_timeout_min
  }

  tags = merge(local.tags, var.tags)
}

resource "aws_workspaces_ip_group" "main" {
  name        = "main"
  description = "Main IP access control group"

  dynamic "rules" {
    for_each = var.access_ip_group
    content {
      source      = rules.value
      description = rules.key
    }
  }
}

resource "aws_vpc_dhcp_options" "dhcp_options_ad" {
  count               = var.create_directory ? 1 : 0
  domain_name_servers = aws_directory_service_directory.main[0].dns_ip_addresses
  domain_name         = var.directory_name
}

resource "aws_vpc_dhcp_options_association" "dns_resolver_ad" {
  count           = var.create_directory && var.update_dhcp_options ? 1 : 0
  vpc_id          = var.create_vpc ? aws_vpc.main[0].id : var.vpc_id
  dhcp_options_id = aws_vpc_dhcp_options.dhcp_options_ad[0].id
}

resource "aws_directory_service_directory" "main" {
  count    = var.create_directory ? 1 : 0
  name     = var.directory_name
  password = var.directory_pass
  type     = var.directory_type
  size     = var.directory_size
  edition  = var.directory_edition
  vpc_settings {
    vpc_id = var.create_vpc ? aws_vpc.main[0].id : var.vpc_id
    subnet_ids = [
      aws_subnet.private_a[0].id,
      aws_subnet.private_b[0].id,
    ]
  }
}
