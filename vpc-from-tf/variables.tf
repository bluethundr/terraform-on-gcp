variable "project" {

  type = string

}

variable "network_name" {
  type = string

}

variable "subnets" {
  type = list(object({
    subnet_name   = string
    subnet_ip     = string
    subnet_region = string
  }))
}


