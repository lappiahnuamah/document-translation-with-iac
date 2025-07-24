output "lambda_arn" {
  value = aws_lambda_function.translation_doc.arn
}

output "function_name" {
  value = aws_lambda_function.translation_doc.function_name
}