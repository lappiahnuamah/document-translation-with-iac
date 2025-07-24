variable "function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "handler" {
  type        = string
  default     = "lambda_function.lambda_handler"
}

variable "runtime" {
  type        = string
  default     = "python3.9"
}

variable "source_zip_path" {
  type        = string
  default     = "lambda_function_payload.zip"
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-2"
}

variable "lambda_role_arn" {
  description = "ARN of the IAM role for Lambda"
  type        = string
}
