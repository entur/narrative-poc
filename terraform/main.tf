# Entur init configuration
module "init" {
  source      = "github.com/entur/terraform-google-init//modules/init?ref=v1.0.0"
  app_id      = "getstarted"
  environment = var.environment
}

# Specify a postgres database
module "postgresql" {
  source    = "github.com/entur/terraform-google-sql-db//modules/postgresql?ref=v1.7.1"
  databases = ["gettingstarted"]
  init      = module.init
}

# Create a random API token
resource "random_password" "api_token" {
  keepers = {
    secret_id = 1 # Changing this will rotate the API_TOKEN
  }

  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

# Create an API token secret
resource "google_secret_manager_secret" "api_token_secret" {
  secret_id = "API_TOKEN"
  labels = {
    rocket = "getting-started"
  }
  replication {
    user_managed {
      replicas {
        location = "europe-west1"
      }
      replicas {
        location = "europe-west4"
      }
    }
  }
  project = module.init.app.project_id
}

# Create a secret version for the API token
resource "google_secret_manager_secret_version" "api_token_secret_version" {
  secret      = google_secret_manager_secret.api_token_secret.id
  secret_data = random_password.api_token.result
}
