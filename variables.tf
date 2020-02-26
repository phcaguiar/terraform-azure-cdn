# CDN Profile
variable "cdn_location" {
  description = "The cdn location."
}

variable "cdn_resource_group_name" {
  description = "The resource group name of the cdn."
}

variable "cdn_profile_name" {
  description = "The name of the CDN profile."
}

variable "cdn_profile_sku" {
  description = "The sku of the CDN profile."
  default     = "Standard_Microsoft"
}

# CDN Endpoint
variable "cdn_endpoint_name" {
  description = "The name of the CDN endpoint."
}

variable "cdn_endpoint_is_http_allowed" {
  description = "Option to allowed is http. The default value is false."
  default     = "false"
}

variable "cdn_endpoint_optimization_type" {
  description = "CDN endpoint optimization type."
  default     = "GeneralWebDelivery"
}

variable "cdn_endpoint_origin_host_header" {
  description = "The origin host header of the cdn endpoint."
}

variable "cdn_endpoint_querystring_caching_behaviour" {
  description = "CDN endpoint querystring caching behaviour."
  default     = "IgnoreQueryString"
}

variable "cdn_endpoint_origin_name" {
  description = "The name of the CDN endpoint origin."
}

variable "cdn_endpoint_origin_https_port" {
  description = "Option to set CDN endpoint origin https port. The default value is 443."
  default     = "443"
}

variable "cdn_endpoint_origin_host_name" {
  description = "The origin host name of the cdn endpoint."
}

variable "has_cdn_custom_domain" {
  description = "If true, the module will create a custom domain name to cdn. The default value is false."
  default     = "false"
}

variable "cdn_custom_domain_name" {
  description = "The custom domain dns name. The default value is null."
  default     = null
}
