variable "region" {
    type = string
    default = ""
  
}

variable "project_id" {
  type = string
  default = ""
}

variable "env" {
  type = string
  default = "dev"
}

variable "neg" {
  type = string
  default = "function-neg"
}

variable "network_endpoint_type" {
  type = string
  default = "SERVERLESS"
}

variable "lb_backend_name" {
  type = string
  default = "backend-service"
}

variable "lb_url_map" {
  type = string
  default = ""
}

variable "http_proxy" {
  type = string
  default = ""
}

variable "lb_forwarding_rule" {
  type = string
  default = ""
}