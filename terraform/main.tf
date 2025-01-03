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
      package = "opendatasets"
    }
  }
  library {
    pypi {
      package = "databricks-feature-engineering"
    }
  }
  library {
    pypi {
      package = "mlflow-skinny[databricks]>=2.5.0"
    }
  }

  library {
    pypi {
      package = "dbldatagen"
    }
  }
}

resource "databricks_secret_scope" "ml_in_action" {
  name = "machine-learning-in-action"
}

resource "databricks_secret" "kaggle_username" {
  key          = "KAGGLE_USERNAME"
  string_value = "rparthas87"
  scope        = databricks_secret_scope.ml_in_action.name
}

resource "databricks_secret" "kaggle_key" {
  key          = "KAGGLE_KEY"
  string_value = var.kaggle_auth_key
  scope        = databricks_secret_scope.ml_in_action.name
}