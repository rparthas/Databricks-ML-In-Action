provider "databricks" {
  host          = "https://dbc-9f62ebb7-db8e.cloud.databricks.com"
  client_id     = var.provider_databricks_client_id
  client_secret = var.provider_databricks_client_secret
}

provider "aws" {
  region = "us-west-2"
}