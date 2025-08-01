output "bucket" { value = aws_s3_bucket.bucket.bucket }
output "output_bucket" { value = aws_s3_bucket.output_bucket.bucket }

output "bucket_arn" {
  value = aws_s3_bucket.bucket.arn
}

output "lambda_bucket_name" {
  value = aws_s3_bucket.lambda_bucket.id
}

output "lambda_bucket_arn" {
  value = aws_s3_bucket.lambda_bucket.arn
}