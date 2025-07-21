data "archive_file" "lambda_zip" {
  type = "zip"
  source_file = "../lambda_function.zip"
  output_path = "lambda.zip"
}

resource "aws_lambda_function" "translate_doc" {
  function_name = var.function_name
  filename = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  runtime = var.runtime
  handler = "translate_document.lambda_handler"
  role = var.lambda_role_arn
  timeout = 60

  environment { variables = { OUTPUT_BUCKET = var.output_bucket } }
}

resource "aws_lambda_permission" "allow_s3" {
  statement_id = "AllowS3Invoke"
  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.translate_doc.function_name
  principal = "s3.amazonaws.com"
  source_arn = var.input_bucket_arn
}

