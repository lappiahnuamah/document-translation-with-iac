# variables.tf (at root level)

variable "region" {
  default = "us-east-2"
}
variable "project_prefix" {
  default = "myproject"
}
# variable "input_bucket" {}
# variable "output_bucket" {}
# variable "function_name" {}
variable "lambda_runtime" {
  description = "The runtime environment for the Lambda function"
  type        = string
  default     = "python3.9"
}

variable "bucket" {
  description = "Name of the input S3 bucket"
  type        = string
  default     = "myproject-input-bucket-law1223jj"
}

variable "output_bucket" {
  description = "Name of the output S3 bucket"
  type        = string
  default     = "myproject-output-bucket-law189888kk"
}

variable "function_name" {
  description = "The name of the Lambda function"
  type        = string
  default     = "translation_doc"
}

variable "handler" {
  description = "Lambda handler"
  type        = string
  default     = "lambda_function.lambda_handler"
}