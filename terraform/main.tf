provider "aws" {
  region  = var.region
}

module "iam" {
  source          = "./iam"
  project_prefix  = var.project_prefix
  input_bucket    = var.input_bucket
  output_bucket   = var.output_bucket
}


module "lambda" {
  source          = "./lambda"
  function_name   = "translation_doc"
  handler         = "lambda_function.lambda_handler"
  runtime         = "python3.9"
  source_zip_path = "lambda_function_payload.zip"
  lambda_role_arn = module.iam.lambda_role_arn
}


module "s3" {
  source        = "./s3"
  input_bucket  = var.input_bucket
  output_bucket = var.output_bucket
  lambda_arn    = module.lambda.lambda_arn
  function_name = module.lambda.function_name
}







