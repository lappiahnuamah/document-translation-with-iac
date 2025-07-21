provider "aws" { region = var.region }

module "s3" {
  source = "./s3"
}

module "iam" {
  source = "./iam"
  project_prefix = var.project_prefix
}

module "lambda" {
  source = "./lambda"
  lambda_role_arn = module.iam.lambda_role_arn
  input_bucket_arn = aws_s3_bucket.input_bucket.arn
  output_bucket = var.s3_output_bucket
  function_name = var.lambda_function_name
  runtime = var.lambda_runtime
}
