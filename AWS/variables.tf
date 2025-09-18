variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "manu-upload-bucket"
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "manu-s3-trigger-lambda"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}
