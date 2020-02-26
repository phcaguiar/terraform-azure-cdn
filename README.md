# Terraform Azure CDN Module

This module creates an Azure CDN profile, CDN endpoint and CDN custom domain following the best practices defined by the SRE/Cloud team at Stone CO.

## Requirements

- Terraform version 0.12+
- Azurerm Provider version 2.0+ (tested on version 2.0.0)
- Terraform Null Provider version 2.1.2

## How to use

The following parameters are mandatory for all resources of this module:

Note: See all variables options in `variables.tf` file.

- ``cdn_resource_group_name``: All resources in this module will be created in this resource group. Ex: Infrastructure-Common-EC2-DEV
- ``cdn_profile_name``: Name of the cdn profile
- ``cdn_location``: The location of the cdn
- ``cdn_endpoint_name``: The name of the cdn endpoint
- ``cdn_endpoint_origin_host_header``: The cdn endpoint origin host header
- ``cdn_endpoint_origin_name``: The cdn endpoint origin name
- ``cdn_endpoint_origin_host_name``: The cdn endpoint origin host name

The following parameters are mandatory to create a cdn custom domain:

- ``has_cdn_custom_domain``: To use this configuration, set value to `true`. To create a custom domain
- ``cdn_custom_domain_name``: The dns name of the cdn

The example below will create a redis cache:

```hcl
module "cdn" {

  "git@github.com:stone-payments/terraform-azure-cdn.git?ref=v1.0.0" # see tags for available versions./modules/redis"

  cdn_profile_name                = "..."
  cdn_location                    = "..."
  cdn_resource_group_name         = "..."
  cdn_endpoint_name               = "..."
  cdn_endpoint_origin_host_header = "..."
  cdn_endpoint_origin_name        = "..."
  cdn_endpoint_origin_host_name   = "..."

}
```

## Contributing

Contributions of all forms are welcome. Just open a new issue or pull request.
