# variable "project_prefix" {}

variable "project_prefix" {
  description = "Prefix for project resources"
  type        = string
  default     = "myproject"
}


variable "bucket" {
  description = "Name of input S3 bucket"
  type        = string
}


variable "output_bucket" {
  description = "Name of output S3 bucket"
  type        = string
}