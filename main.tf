module "cloud_function" {
  source          = "./module/cloud-function"
  env             = var.env
  function_bucket = var.function_bucket
  function_name   = var.function_name
  description     = var.description
  runtime         = var.runtime
  entry_point     = var.entry_point
}

module "lb" {
  source                = "./module/loadbalancer"
  env                   = var.env
  neg                   = var.neg
  network_endpoint_type = var.network_endpoint_type
  lb_backend_name       = var.lb_backend_name
  lb_url_map            = var.lb_url_map
  http_proxy            = var.http_proxy
  lb_forwarding_rule    = var.lb_forwarding_rule
}

# module "network" {
#   source = "./module/network"
# }
