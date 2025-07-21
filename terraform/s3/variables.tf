variable "s3_output_bucket" {
  description = "Name of the output bucket"
  type        = string
}


variable "s3_input_bucket" {
  description = "Name of the input bucket"
  type        = string
}

variable "lambda_function_arn" {}
