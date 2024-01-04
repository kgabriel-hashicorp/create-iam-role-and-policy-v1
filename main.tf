module "test_s3_bucket" {

  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.14.1"

  bucket = var.bucket_name
  versioning = {
    enabled = var.enable_versioning
  }
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "${var.bucket_name}-aws"
  acl    = "private"

  versioning {
    enabled = var.enable_versioning
  }

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

module "iam-policy-and-role-v3" {
  source  = "tfe.karla-gabriel.sbx.hashidemos.io/kg-dev/iam-policy-and-role-v3/aws"
  version = "1.0.0"
  role_name = "test-role"
}