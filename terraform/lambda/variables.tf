variable "function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "handler" {
  type    = string
  default = "lambda_function.lambda_handler"
}

variable "runtime" {
  type    = string
  default = "python3.9"
}

variable "source_zip_path" {
  type    = string
  default = "lambda_function.zip"
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-2"
}

variable "lambda_bucket_name" {
  description = "Name of the S3 bucket to upload Lambda code"
  type        = string
}

variable "lambda_role_arn" {
  description = "ARN of the IAM role for Lambda"
  type        = string
}


variable "retention_in_days" {
  description = "Cloudwatch retention days"
  type        = number
  default = 7
}