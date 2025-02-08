resource "aws_s3_bucket" "s3_bucket" {
  bucket = "terraform-state-s3-bucket"
  tags = {
    Name        = "terraform-state-s3-bucket"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "s3_bucket_versioning" {
  bucket = aws_s3_bucket.s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "dynamodb_table" {
  name         = "terraform-state-dynamodb-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"

  }
}

terraform {
  backend "s3" {
    bucket         = "terraform-state-s3-bucket"
    key            = "dev/terraform.tfstate"
    region         = "us-west-1"
    dynamodb_table = "terraform-state-dynamodb-table"
    encrypt        = true
  }
}