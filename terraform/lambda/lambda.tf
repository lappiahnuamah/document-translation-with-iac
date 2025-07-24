# resource "aws_iam_role" "lambda_exec" {
#   name = "${var.function_name}-exec-role"
#   # name = "lambda_exec"
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [{
#       Effect = "Allow"
#       Principal = { Service = "lambda.amazonaws.com" }
#       Action = "sts:AssumeRole"
#     }]
#   })
# }

# resource "aws_iam_role_policy_attachment" "lambda_logs" {
#   role       = aws_iam_role.lambda_exec.name
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
# }

resource "aws_lambda_function" "translation_doc" {
  function_name    = var.function_name
  handler          = var.handler
  runtime          = var.runtime
  role             = var.lambda_role_arn
  filename         = var.source_zip_path
  source_code_hash = filebase64sha256(var.source_zip_path)
}
