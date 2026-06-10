output "rds_primary_endpoint" {
  description = "Primary RDS endpoint address."
  value       = aws_db_instance.primary.address
}

output "rds_primary_port" {
  description = "Primary RDS port."
  value       = aws_db_instance.primary.port
}

output "rds_replica_endpoint" {
  description = "Read replica endpoint address."
  value       = aws_db_instance.replica.address
}

output "rds_replica_port" {
  description = "Read replica port."
  value       = aws_db_instance.replica.port
}

output "redis_primary_endpoint" {
  description = "ElastiCache Redis primary endpoint address."
  value       = aws_elasticache_replication_group.redis.primary_endpoint_address
}

output "redis_reader_endpoint" {
  description = "ElastiCache Redis reader endpoint address."
  value       = aws_elasticache_replication_group.redis.reader_endpoint_address
}

output "redis_port" {
  description = "ElastiCache Redis port."
  value       = aws_elasticache_replication_group.redis.port
}
