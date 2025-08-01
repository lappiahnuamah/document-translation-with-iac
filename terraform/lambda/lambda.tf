locals {
  lambda_files = fileset(".${path.root}/lambda_package/lambda", "**")
}

resource "null_resource" "build_lambda" {
  triggers = {
    # Create a combined hash of all files in the directory
    lambda_hash = join("", [
      for file in local.lambda_files :
      filesha256(".${path.root}/lambda_package/lambda/${file}")
    ])
  }

  provisioner "local-exec" {
    working_dir = ".${path.root}/lambda_package"
    command     = "./build.sh"
  }
}

data "archive_file" "lambda_handler_archive_file" {
  type        = "zip"
  source_dir  = ".${path.root}/lambda_package/lambda_package"
  output_path = "${path.module}/lambda_function.zip"
}

resource "aws_s3_object" "lambda_handler_bucket_object" {
  bucket = var.lambda_bucket_name
  key    = "lambda_function.zip"
  source = data.archive_file.lambda_handler_archive_file.output_path

  etag = filemd5(data.archive_file.lambda_handler_archive_file.output_path)

  depends_on = [
    data.archive_file.lambda_handler_archive_file,
  ]
}

resource "aws_lambda_function" "translation_doc" {

  function_name = var.function_name
  description   = "Lambda function for ${var.function_name}"
  runtime       = var.runtime
  handler       = var.handler
  role             = var.lambda_role_arn
  source_code_hash = data.archive_file.lambda_handler_archive_file.output_base64sha256 // or filebase64sha256(handler.zip)
  s3_bucket        = var.lambda_bucket_name
  s3_key           = aws_s3_object.lambda_handler_bucket_object.key


  depends_on = [
    aws_s3_object.lambda_handler_bucket_object
  ]

}


resource "aws_cloudwatch_log_group" "lambda_cloudwatch_log" {
  name              = "/aws/lambda/${aws_lambda_function.translation_doc.function_name}"
  retention_in_days = var.retention_in_days
}