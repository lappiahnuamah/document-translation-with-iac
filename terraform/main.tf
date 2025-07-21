provider "aws" {
  region = var.region
}

module "iam" {
  source              = "./iam"
  project_prefix      = var.project_prefix
  s3_input_bucket     = var.s3_input_bucket
  s3_output_bucket    = var.s3_output_bucket
}

module "lambda" {
  source            = "./lambda"
  lambda_role_arn   = module.iam.lambda_role_arn
  output_bucket     = var.s3_output_bucket
  function_name     = var.lambda_function_name
  runtime           = var.lambda_runtime
}

module "s3" {
  source              = "./s3"
  s3_input_bucket     = var.s3_input_bucket
  s3_output_bucket    = var.s3_output_bucket
  lambda_function_arn = module.lambda.lambda_function_arn
}




