############ Command Variables ############

variable "project_id" {
  type = string
  default = ""
}
variable "region" {
  type = string
  default = ""
}
variable "zone" {
  type = string
  default = ""
}
variable "env" {
  type = string
  default = "dev"
}

variable "function_bucket" {
  type = string
  default = "hello-function-bucket"
}

variable "function_name" {
  type = string
   default = ""
}

variable "description" {
  type = string
  default = "this function will return hello world"
}

variable "runtime" {
  type = string
  default = "pyhton39"
}

variable "entry_point" {
  type = string
  default = "hello_world"
}
###########################################


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
  default = "function-forwarding-rule"
}