resource "aws_s3_bucket" "input_bucket" {
  bucket = var.s3_input_bucket
  force_destroy = true
}

resource "aws_s3_bucket" "output_bucket" {
  bucket = var.s3_output_bucket
  force_destroy = true
}

resource "aws_s3_bucket_notification" "notify_lambda" {
  bucket = aws_s3_bucket.input_bucket.id

  lambda_function {
    lambda_function_arn = var.lambda_function_arn
    events = ["s3:ObjectCreated:*"]
  }

  depends_on = [aws_lambda_permission.allow_s3]
}

