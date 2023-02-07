output "postgres_host" {
  description = "The Aiven PG connection host"
  value       = aiven_pg.pg_instance.service_host
}

output "postgres_port" {
  description = "The Aiven PG connection port"
  value       = tostring(aiven_pg.pg_instance.service_port)
}

output "postgres_user" {
  description = "The Aiven PG username"
  value       = aiven_pg.pg_instance.service_username
}

output "postgres_db_name" {
  description = "The Aiven PG database name"
  value       = aiven_pg_database.pg_database.database_name
}

output "postgres_password" {
  description = "The Aiven PG password"
  value       = aiven_pg.pg_instance.service_password
  sensitive   = true
}
