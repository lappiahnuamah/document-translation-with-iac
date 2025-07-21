# #!/bin/bash
# echo "Zipping Lambda function with dependencies..."

# mkdir -p lambda_package
# pip install -r lambda/requirements.txt -t lambda_package
# cp lambda/translate_document.py lambda_package/

# cd lambda_package
# zip -r ../lambda_function.zip .
# cd ..

# echo "Lambda function zipped and ready for deployment: lambda_function.zip"
