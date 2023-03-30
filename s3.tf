resource "aws_s3_bucket" "backend" {
    bucket = "rellis-terraforms3"
}

resource "aws_s3_bucket_versioning" "backend" {
    bucket = aws_s3_bucket.backend.id
    versioning_configuration {
      status = "Enabled"
    }   
}

data "aws_iam_policy_document" "backend" {
    statement {
      sid = "Public view"
      principals {
        type = "AWS"
        identifiers = ["*"]
      }
      actions = [
        "s3:*"
      ]
      resources = [
        aws_s3_bucket.backend.arn, "${aws_s3_bucket.backend.arn}/*"
      ]
    }
  
}

resource "aws_s3_bucket_policy" "backend" {
    bucket = aws_s3_bucket.backend.id
    policy = data.aws_iam_policy_document.backend.json
}