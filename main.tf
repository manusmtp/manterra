provider "aws" {
    region = "us-west-2"
}

module "s3_bucket" {
    source = "terraform-aws-modules/s3-bucket/aws"

    bucket = "manprasadbuck"
    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false

    control_object_ownership = true
    object_ownership         = "BucketOwnerPreferred"

    versioning = {
        enabled = true
    }

    website = {
        index_document = "index.html"
        error_document = "error.html"
    }
}

resource "aws_s3_bucket_object" "index_html" {
    bucket =  module.s3_bucket.s3_bucket_id
    key    = "index.html"
    source = "index.html"
    acl    = "public-read"
    content_type = "text/html"
    cache_control = "no-cache"
    # Ensure content is treated as UTF-8
    content_encoding = "utf-8"
}

resource "aws_s3_bucket_object" "error_html" {
    bucket = module.s3_bucket.s3_bucket_id
    key    = "error.html"
    source = "error.html"
    acl    = "public-read"
    content_type = "text/html"
    cache_control = "no-cache"
    # Ensure content is treated as UTF-8
    content_encoding = "utf-8"
}

output "s3_bucket_website_url" {
    value       = module.s3_bucket.s3_bucket_website_endpoint
    description = "The URL of the S3 bucket website"
}



output "s3_bucket_endpoint" {
    value       = module.s3_bucket.s3_bucket_bucket_domain_name
    description = "The endpoint of the S3 bucket"
}