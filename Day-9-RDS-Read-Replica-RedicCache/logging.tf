resource "aws_cloudwatch_log_group" "redis_engine" {
  name              = "/aws/elasticache/${local.name_prefix}/engine"
  retention_in_days = var.log_retention_days

  tags = {
    Name = "${local.name_prefix}-redis-engine-logs"
  }
}

resource "aws_cloudwatch_log_group" "redis_slow" {
  name              = "/aws/elasticache/${local.name_prefix}/slow-log"
  retention_in_days = var.log_retention_days

  tags = {
    Name = "${local.name_prefix}-redis-slow-logs"
  }
}
