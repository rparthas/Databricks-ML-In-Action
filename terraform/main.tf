resource "databricks_cluster" "single_user_ml_cluster" {
  cluster_name            = "single-user-ml-cluster"
  spark_version           = "15.4.x-cpu-ml-scala2.12"
  node_type_id            = "i3en.large"
  autotermination_minutes = 10
  data_security_mode      = "SINGLE_USER"
  single_user_name        = "rajagopal.sarathi@gmail.com"

  spark_conf = {
    "spark.databricks.cluster.profile" = "singleNode"
    "spark.master"                     = "local[*]"
  }

  custom_tags = {
    "Purpose" = "ML"
    "ResourceClass" = "SingleNode"
  }

  library {
    pypi {
      package = "pandas"
    }
  }

  library {
    pypi {
      package = "numpy"
    }
  }
}