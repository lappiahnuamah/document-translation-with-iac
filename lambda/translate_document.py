import boto3
import os
import tempfile
from docx import Document
from PyPDF2 import PdfReader
import textract

s3 = boto3.client('s3')
translate = boto3.client('translate')

DEST_BUCKET = os.environ['OUTPUT_BUCKET']

def lambda_handler(event, context):
    record = event['Records'][0]['s3']
    bucket = record['bucket']['name']
    key = record['object']['key']
    
    with tempfile.TemporaryDirectory() as tmpdir:
        src_path = os.path.join(tmpdir, os.path.basename(key))
        s3.download_file(bucket, key, src_path)

        ext = key.split('.')[-1].lower()
        if ext == 'txt':
            text = open(src_path, 'r', encoding='utf-8').read()
        elif ext == 'docx':
            doc = Document(src_path)
            text = "\n".join([p.text for p in doc.paragraphs])
        elif ext == 'pdf':
            text = textract.process(src_path).decode('utf-8')
        else:
            raise ValueError(f"Unsupported format: {ext}")

        # Optional: enforce length limits
        translated = translate.translate_text(
            Text=text,
            SourceLanguageCode='auto',
            TargetLanguageCode='es'
        )['TranslatedText']

        out_key = f"translated_{os.path.splitext(key)[0]}.txt"
        s3.put_object(
            Bucket=DEST_BUCKET,
            Key=out_key,
            Body=translated.encode('utf-8')
        )

    return {"statusCode": 200, "body": f"Translated to {DEST_BUCKET}/{out_key}"}
