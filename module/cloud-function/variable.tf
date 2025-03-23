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

