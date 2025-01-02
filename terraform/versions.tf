terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.57.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "3.51.0" # Specify the version you need
    }
  }
}