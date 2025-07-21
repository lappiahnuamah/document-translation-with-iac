output "lambda_function_arn" {
  value = aws_lambda_function.translation_function.arn
}

output "input_bucket_arn" {
  value = aws_s3_bucket.input_bucket.arn
}
