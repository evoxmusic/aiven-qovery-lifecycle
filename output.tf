output "postgres_host" {
  description = "The Aiven PG connection host"
  value       = aiven_pg.pg-sample.service_host
}

output "postgres_port" {
  description = "The Aiven PG connection port"
  value       = aiven_pg.pg-sample.service_port
}

output "postgres_user" {
  description = "The Aiven PG username"
  value       = aiven_pg.pg-sample.service_username
}

output "postgres_db_name" {
  description = "The Aiven PG database name"
  value       = aiven_pg.pg-sample.service_username
}

output "postgres_password" {
  description = "The Aiven PG password"
  value       = aiven_pg.pg-sample.service_password
  sensitive   = true
}
