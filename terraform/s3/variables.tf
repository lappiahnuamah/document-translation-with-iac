variable "bucket" {
  description = "Name of the input S3 bucket"
  type        = string
  default     = "myproject-input-bucket-law1223op"
}

variable "output_bucket" {
  description = "Name of the output S3 bucket"
  type        = string
  default     = "myproject-output-bucket-law189888jj"
}

variable "lambda_bucket" {
  description = "Name of the lambda S3 bucket"
  type        = string
  default     = "myproject-lambda-bucket-law12345"
}

variable "lambda_arn" {}

variable "function_name" {}


