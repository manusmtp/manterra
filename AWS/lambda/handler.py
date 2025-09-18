import json
import boto3

def lambda_handler(event, context):
    print("Event received:", json.dumps(event))

    s3 = boto3.client('s3')
    bucket = event['Records'][0]['s3']['bucket']['name']
    key = event['Records'][0]['s3']['object']['key']

    new_key = f"processed/{key}"
    s3.put_object(Bucket=bucket, Key=new_key, Body="Processed by Lambda")

    return {
        'statusCode': 200,
        'body': json.dumps(f"Processed {key} and created {new_key}")
    }
 