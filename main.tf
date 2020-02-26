resource "azurerm_cdn_profile" "cdn_profile" {
  name                = var.cdn_profile_name
  location            = var.cdn_location
  resource_group_name = var.cdn_resource_group_name
  sku                 = var.cdn_profile_sku
}

resource "azurerm_cdn_endpoint" "cdn_endpoint" {
  name                = var.cdn_endpoint_name
  profile_name        = var.cdn_profile_name
  location            = var.cdn_location
  resource_group_name = var.cdn_resource_group_name
  is_http_allowed     = var.cdn_endpoint_is_http_allowed
  optimization_type   = var.cdn_endpoint_optimization_type
  origin_host_header  = var.cdn_endpoint_origin_host_header
  querystring_caching_behaviour = var.cdn_endpoint_querystring_caching_behaviour
  
  origin {
    name        = var.cdn_endpoint_origin_name
    host_name   = var.cdn_endpoint_origin_host_name
    https_port  = var.cdn_endpoint_origin_https_port
  }

  depends_on    = [azurerm_cdn_profile.cdn_profile]

}

resource "null_resource" "cdn_custom_domain" {
  count         = var.has_cdn_custom_domain ? 1 : 0

  provisioner "local-exec" {
    command = "az cdn custom-domain create -g ${var.cdn_resource_group_name} --endpoint-name ${var.cdn_endpoint_name} --profile-name ${var.cdn_profile_name} -n domain-name --hostname ${var.cdn_custom_domain_name} && az cdn custom-domain enable-https -g ${var.cdn_resource_group_name} --endpoint-name ${var.cdn_endpoint_name} --profile-name ${var.cdn_profile_name} -n domain-name"
  }

  depends_on    = [azurerm_cdn_endpoint.cdn_endpoint]
}
