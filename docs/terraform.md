## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| attributes | Additional attributes (e.g. `1`) | list(string) | `<list>` | no |
| bucket_force_destroy | A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable | bool | `false` | no |
| delimiter | Delimiter to be used between `namespace`, `stage`, `name` and `attributes` | string | `-` | no |
| generate_keys | If set to `true` this module will generate the necessary RSA keys with the [`tls_private_key`](https://www.terraform.io/docs/providers/tls/r/private_key.html) resource and upload them to S3 (server-side encrypted). **Be aware** that this will store the generated *unencrypted* keys in the Terraform state, so be sure to use a secure state backend (e.g. S3 encrypted), or set this to `false` and generate the keys manually | string | `true` | no |
| keys_version | Change this if you want to re-generate Concourse keys | string | `1` | no |
| name | Application or solution name (e.g. `app`) | string | `concourse` | no |
| namespace | Namespace (e.g. `cp` or `cloudposse`) | string | - | yes |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | string | - | yes |
| tags | Additional tags (e.g. map(`BusinessUnit`,`XYZ`) | map(string) | `<map>` | no |
| worker_iam_role_arns | List of ARNs for the IAM roles that will be able to assume the role to access concourse keys in S3. Normally you'll include the Concourse worker IAM role here | list(string) | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| bucket_arn | The ARN of the S3 bucket where the concourse keys are stored |
| bucket_id | The id (name) of the S3 bucket where the concourse keys are stored |
| cross_account_role_arn | IAM role ARN that Concourse workers on other AWS accounts will need to assume to access the Concourse keys bucket |

