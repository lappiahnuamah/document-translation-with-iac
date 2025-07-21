region              = "us-east-2" # or your preferred AWS region
project_prefix      = "doctranslate"

s3_input_bucket     = "doctranslate-input-bucket-lawrence"   # Must be globally unique!
s3_output_bucket    = "doctranslate-output-bucket-lawrence"  # Must also be globally unique!

lambda_function_name = "doctranslate-function"
lambda_runtime       = "python3.12"
