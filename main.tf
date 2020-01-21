module "default_label" {
  source      = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.16.0"
  name        = var.name
  namespace   = var.namespace
  stage       = var.stage
  tags        = var.tags
  attributes  = var.attributes
  delimiter   = var.delimiter
}
