# 🗂️ File Translation Project on AWS (Free Tier)

## 📌 Overview
A serverless solution to automatically translate documents (`.txt`, `.docx`, `.pdf`) using AWS Translate. Input and output files are stored in Amazon S3, and the translation is triggered via AWS Lambda.

## 📁 Structure
```
file-translation-project/
├── terraform/                     # Terraform scripts to create infra
│   └── main.tf
├── lambda/                        # Python Lambda function source
│   └── translate_document.py
├── .github/workflows/deploy.yml  # GitHub Actions CI/CD
├── input_sample.txt               # Sample text file
├── input_sample.docx              # Sample Word document
├── input_sample.pdf               # Sample PDF document
├── README.md
```

## ✅ Features
- Document translation from `.txt`, `.docx`, `.pdf`
- AWS Translate via Lambda (serverless)
- Fully automated CI/CD with GitHub Actions
- Infrastructure-as-Code using Terraform
- Free-tier friendly (Translate + S3 + Lambda)

## 🚀 Setup Instructions

### 1. Clone & Configure AWS CLI
```bash
git clone https://github.com/your-username/file-translation-project.git
cd file-translation-project
aws configure
```

### 2. GitHub Secrets
Add the following to your GitHub repo under **Settings > Secrets and variables > Actions**:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

### 3. Trigger Deployment
Push changes to `main` or trigger the workflow manually:
```bash
git add .
git commit -m "init"
git push origin main
```
GitHub Actions will:
- Package Lambda with dependencies
- Apply Terraform and deploy

### 4. Upload Sample Input File
```bash
aws s3 cp input_sample.docx s3://<source_bucket>
```
> Replace with `.pdf` or `.txt` file if preferred.

### 5. Check Output Bucket
```bash
aws s3 ls s3://<translated_bucket>
aws s3 cp s3://<translated_bucket>/<output_file> .
cat translated_<your_file>.txt
```

## 🧪 Sample Inputs
### `input_sample.txt`
```
Welcome to the document translation service.
We hope this works smoothly!
```

### `input_sample.docx`
- Contains two paragraphs of sample English text.

### `input_sample.pdf`
- Simple one-page PDF with a few sentences for translation.

## 💰 Cost Control
- AWS Free Tier: S3, Translate, Lambda (1M requests/mo)
- No EC2, no RDS — only pay if usage exceeds free tier
- Clean up by running: `terraform destroy`

## 🔐 IAM Permissions Needed
```json
{
  "Effect": "Allow",
  "Action": ["s3:*", "translate:*", "logs:*"],
  "Resource": "*"
}
```

## 📚 References
- [AWS Translate](https://aws.amazon.com/translate/)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [GitHub Actions for AWS](https://github.com/aws-actions/)
- [Textract](https://textract.readthedocs.io/) for PDF text parsing

---
