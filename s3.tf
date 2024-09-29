resource "aws_s3_bucket" "example" {
  bucket = "example"
}

resource "aws_s3_bucket_lifecycle_configuration" "example" {
  bucket = aws_s3_bucket.example.bucket

  rule {
    id     = "intelligent-tiering"
    status = "Enabled"

    filter {
      prefix = "test/"
    }

    transition {
      days          = 0
      storage_class = "INTELLIGENT_TIERING"
    }

    noncurrent_version_transition {
      noncurrent_days = 0
      storage_class   = "INTELLIGENT_TIERING"
    }

    abort_incomplete_multipart_upload {
      days_after_initiation = 14
    }
  }
}
