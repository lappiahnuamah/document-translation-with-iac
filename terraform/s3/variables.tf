variable "input_bucket" {
  description = "Name of the input S3 bucket"
  type        = string
  default     = "myproject-input-bucket"
}
variable "output_bucket" {
  description = "Name of the output S3 bucket"
  type        = string
  default     = "myproject-output-bucket"
}
variable "lambda_arn" {}

variable "function_name" {}


