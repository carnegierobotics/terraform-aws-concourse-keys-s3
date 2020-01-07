output "bucket_id" {
  value       = aws_s3_bucket.keys.id
  description = "The id (name) of the S3 bucket where the concourse keys are stored"
}

output "bucket_arn" {
  value       = aws_s3_bucket.keys.arn
  description = "The ARN of the S3 bucket where the concourse keys are stored"
}

output "cross_account_role_arn" {
  value       = aws_iam_role.keys.arn
  description = "IAM role ARN that Concourse workers on other AWS accounts will need to assume to access the Concourse keys bucket"
}

