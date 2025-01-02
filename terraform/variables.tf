variable "provider_databricks_client_id" {
  description = "Client id of the Databricks service principal."
  type        = string
  sensitive   = true
}
variable "provider_databricks_client_secret" {
  description = "Client secret of the Databricks service principal."
  type        = string
  sensitive   = true
}