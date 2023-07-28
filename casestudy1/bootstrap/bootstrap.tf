# Set up the AWS provider and region
provider "aws" {
  region = "us-east-1"  # Replace with your desired AWS region
}

# Create an S3 bucket for the Terraform state
resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = "xalts-venkateshch-tf-state-bucket"  # Replace with a globally unique name for your S3 bucket
  acl    = "private"

  versioning {
    enabled = true
  }
}

# Create a DynamoDB table for Terraform state locking
resource "aws_dynamodb_table" "state_lock_table" {
  name           = "xalts_venkateshch_tf_state_lock_table"  # Replace with a name for the DynamoDB table for state locking
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

# Output the S3 bucket and DynamoDB table names
output "s3_bucket_name" {
  value = aws_s3_bucket.tf_state_bucket.id
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.state_lock_table.name
}