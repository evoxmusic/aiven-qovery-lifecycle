terraform {
  required_providers {
    aiven = {
      source  = "aiven/aiven"
      version = "~> 3.9.0"
    }
  }

  backend "s3" {}
}

provider "aiven" {
  api_token = var.aiven_api_token
}

resource "aiven_pg" "pg_instance" {
  project                 = var.aiven_project_name
  cloud_name              = "aws-us-east-2"
  plan                    = "startup-4"
  # make the service name unique by adding a suffix based on the first digit of the Qovery environment ID
  service_name            = "pg-${split("-", var.qovery_environment_id)[0]}"
  maintenance_window_dow  = "monday"
  maintenance_window_time = "10:00:00"
}

resource "aiven_pg_database" "pg_database" {
  database_name = var.aiven_database_name
  project       = var.aiven_project_name
  service_name  = aiven_pg.pg_instance.service_name
}
