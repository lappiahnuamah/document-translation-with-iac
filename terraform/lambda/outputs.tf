output "lambda_arn" {
  value = aws_lambda_function.translation_doc.arn
}

output "function_name" {
  value = aws_lambda_function.translation_doc.function_name
}

# output "lambda_bucket_name" {
#   value = aws_s3_bucket.lambda_bucket.id
# }

# output "lambda_bucket_arn" {
#   value = aws_s3_bucket.lambda_bucket.arn
# }