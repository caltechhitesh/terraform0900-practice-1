resource "aws_elasticache_parameter_group" "redis" {
  name   = "${local.name_prefix}-redis7"
  family = "redis7"

  tags = {
    Name = "${local.name_prefix}-redis7"
  }
}

resource "aws_elasticache_replication_group" "redis" {
  replication_group_id       = "${local.name_prefix}-redis"
  description                = "Production Redis replication group for ${var.project_name}"
  node_type                  = var.redis_node_type
  port                       = 6379
  engine                     = "redis"
  engine_version             = var.redis_engine_version
  parameter_group_name       = aws_elasticache_parameter_group.redis.name
  subnet_group_name          = aws_elasticache_subnet_group.this.name
  security_group_ids         = [aws_security_group.redis.id]
  automatic_failover_enabled = true
  multi_az_enabled           = true
  num_cache_clusters         = var.redis_num_cache_clusters
  at_rest_encryption_enabled = true
  transit_encryption_enabled = true
  kms_key_id                 = aws_kms_key.elasticache.arn
  auth_token                 = var.redis_auth_token
  maintenance_window         = var.redis_maintenance_window
  snapshot_retention_limit   = var.redis_snapshot_retention_limit
  snapshot_window            = var.redis_snapshot_window
  apply_immediately          = var.apply_immediately

  log_delivery_configuration {
    destination      = aws_cloudwatch_log_group.redis_engine.name
    destination_type = "cloudwatch-logs"
    log_format       = "json"
    log_type         = "engine-log"
  }

  log_delivery_configuration {
    destination      = aws_cloudwatch_log_group.redis_slow.name
    destination_type = "cloudwatch-logs"
    log_format       = "json"
    log_type         = "slow-log"
  }

  tags = {
    Name = "${local.name_prefix}-redis"
  }
}
