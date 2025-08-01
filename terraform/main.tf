provider "aws" {
  region = var.region
}

module "iam" {
  source         = "./iam"
  project_prefix = var.project_prefix
  bucket         = var.bucket
  output_bucket  = var.output_bucket
}

module "s3" {
  source        = "./s3"
  bucket        = var.bucket
  output_bucket = var.output_bucket
  lambda_arn    = module.lambda.lambda_arn
  function_name = module.lambda.function_name
}

module "lambda" {
  source          = "./lambda"
  function_name   = var.function_name
  handler         = var.handler
  runtime         = var.lambda_runtime
  # source_zip_path = "lambda_function_payload.zip"
  lambda_role_arn = module.iam.lambda_role_arn
  lambda_bucket_name = module.s3.lambda_bucket_name

  # depends_on = [ module.s3 ]
}










