# terraform {
#     backend "s3" {
#     bucket         = "databricks-workspace-stack-31d2d-bucket"
#     key            = "prod/terraform.tfstate"
#     region         = "us-west-2"
#     dynamodb_table = "terraform-lock"
#     encrypt        = true
#     }
# }