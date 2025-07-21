resource "aws_iam_role" "lambda_exec_role" {
  name = "${var.project_prefix}-lambda-role"
  assume_role_policy = jsonencode({
    Version="2012-10-17",
    Statement=[{
      Action="sts:AssumeRole",
      Effect="Allow",
      Principal={ Service="lambda.amazonaws.com" }
    }]
  })
}

resource "aws_iam_policy" "lambda_policy" {
  name = "${var.project_prefix}-policy"
  policy = jsonencode({
    Version="2012-10-17",
    Statement=[
      {
        Effect="Allow",
        Action=[ "logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents" ],
        Resource="*"
      },
      {
        Effect="Allow",
        Action=[ "s3:GetObject", "s3:PutObject" ],
        Resource=["arn:aws:s3:::${var.s3_input_bucket}/*", "arn:aws:s3:::${var.s3_output_bucket}/*"]
      },
      {
        Effect="Allow",
        Action=[ "translate:TranslateText" ],
        Resource="*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_exec_policy" {
  role = aws_iam_role.lambda_exec_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}
