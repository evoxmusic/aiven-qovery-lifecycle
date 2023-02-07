variable "terraform_backend_bucket" {
  type    = string
  # TODO change this to your bucket name
  default = "qovery-aiven-terraform-states" # Name of the Backend S3 bucket
}

variable "terraform_backend_key" {
  type    = string
  default = "test" # Name of the Backend S3 key
}

variable "aiven_api_token" {
  description = "Aiven console API token"
  type        = string
}

variable "aiven_project_name" {
  description = "Aiven console project name"
  type        = string
}

variable "aiven_database_name" {
  description = "Aiven database instance name"
  type        = string
  default     = "test"
}

variable "qovery_environment_id" {
  type    = string
  default = "1234567890"
}
