variable "project" {

  type = string

}

variable "location" {
  type = string

}

variable "bucket_name" {
  type = string
}

variable "region" {
  type = string
}

variable "storage_class" {
  type = string
}

variable "uniform_bucket_level_access" {
  type = bool
}

variable "force_destroy" {
  type = bool
}