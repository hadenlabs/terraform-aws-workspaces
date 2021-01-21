locals {
  tags = null
  region_workspaces_az_id_strings = {
    "us-east-1" = join(",", formatlist("use1-az%d", list("2", "4", "6")))
  }

  workspaces_az_id_strings = lookup(local.region_workspaces_az_id_strings, data.aws_region.current.name, join(",", data.aws_availability_zones.available.zone_ids))
  workspaces_az_ids        = split(",", local.workspaces_az_id_strings)
}

resource "aws_workspaces_directory" "main" {
  directory_id = aws_directory_service_directory.main.id

  subnet_ids = [
    aws_subnet.private_a.id,
    aws_subnet.private_b.id,
  ]

  self_service_permissions {
    increase_volume_size = true
    rebuild_workspace    = true
  }

  depends_on = [
    aws_iam_role.main,
  ]
}

resource "aws_workspaces_workspace" "main" {
  directory_id = aws_workspaces_directory.main.id
  bundle_id    = data.aws_workspaces_bundle.bundle.id
  user_name    = var.user_name

  root_volume_encryption_enabled = var.root_volume_encryption_enabled
  user_volume_encryption_enabled = var.user_volume_encryption_enabled
  volume_encryption_key          = var.volume_encryption_key

  workspace_properties {
    compute_type_name                         = "VALUE"
    user_volume_size_gib                      = 10
    root_volume_size_gib                      = 80
    running_mode                              = "AUTO_STOP"
    running_mode_auto_stop_timeout_in_minutes = 60
  }

  tags = merge(local.tags, var.tags)
}

resource "aws_workspaces_ip_group" "main" {
  name        = "main"
  description = "Main IP access control group"

  rules {
    source = "10.10.10.10/16"
  }

  rules {
    source      = "11.11.11.11/16"
    description = "Contractors"
  }
}

resource "aws_vpc_dhcp_options" "dhcp_options_ad" {
  count               = var.create_directory ? 1 : 0
  domain_name_servers = aws_directory_service_directory.main.dns_ip_addresses
  domain_name         = var.directory_name
}

resource "aws_vpc_dhcp_options_association" "dns_resolver_ad" {
  count           = var.create_directory && var.update_dhcp_options ? 1 : 0
  vpc_id          = aws_vpc.main.id
  dhcp_options_id = aws_vpc_dhcp_options.dhcp_options_ad[0].id
}

resource "aws_directory_service_directory" "main" {
  name     = var.directory_name
  password = var.directory_pass
  type     = var.directory_type
  size     = var.directory_size
  edition  = var.directory_edition
  vpc_settings {
    vpc_id = aws_vpc.main.id
    subnet_ids = [
      aws_subnet.private_a.id,
      aws_subnet.private_b.id,
    ]
  }
}
