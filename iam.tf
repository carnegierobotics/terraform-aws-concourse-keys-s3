data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      type        = "AWS"
      identifiers = var.worker_iam_role_arns
    }
  }
}

data "aws_iam_policy_document" "cross_account" {
  statement {
    effect = "Allow"

    actions = [
      "s3:Get*",
      "s3:List*",
    ]

    resources = [
      aws_s3_bucket.keys.arn,
      "${aws_s3_bucket.keys.arn}/*",
    ]
  }
}

resource "aws_iam_role" "keys" {
  name                = module.default_label.id
  description         = "Cross account key access role for Concourse workers"
  assume_role_policy  = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy" "concourse_keys_cross_account" {
  role   = aws_iam_role.keys.name
  policy = data.aws_iam_policy_document.cross_account.json
}

