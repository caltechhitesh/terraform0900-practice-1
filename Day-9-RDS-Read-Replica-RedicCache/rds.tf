resource "aws_db_parameter_group" "mysql" {
  name   = "${local.name_prefix}-mysql80"
  family = "mysql8.0"

  parameter {
    name  = "slow_query_log"
    value = "1"
  }

  tags = {
    Name = "${local.name_prefix}-mysql80"
  }
}

resource "aws_db_instance" "primary" {
  identifier                            = "${local.name_prefix}-primary"
  engine                                = "mysql"
  engine_version                        = var.db_engine_version
  instance_class                        = var.db_instance_class
  allocated_storage                     = var.db_allocated_storage
  max_allocated_storage                 = var.db_max_allocated_storage
  storage_type                          = "gp3"
  storage_encrypted                     = true
  kms_key_id                            = aws_kms_key.rds.arn
  db_name                               = var.db_name
  username                              = var.db_username
  password                              = var.db_password
  port                                  = 3306
  db_subnet_group_name                  = aws_db_subnet_group.this.name
  vpc_security_group_ids                = [aws_security_group.rds.id]
  parameter_group_name                  = aws_db_parameter_group.mysql.name
  backup_retention_period               = var.db_backup_retention_period
  backup_window                         = var.db_backup_window
  maintenance_window                    = var.db_maintenance_window
  multi_az                              = true
  publicly_accessible                   = false
  skip_final_snapshot                   = false
  final_snapshot_identifier             = "${local.name_prefix}-primary-final"
  deletion_protection                   = true
  copy_tags_to_snapshot                 = true
  performance_insights_enabled          = true
  performance_insights_kms_key_id       = aws_kms_key.rds.arn
  performance_insights_retention_period = 7
  monitoring_interval                   = 60
  monitoring_role_arn                   = aws_iam_role.rds_enhanced_monitoring.arn
  auto_minor_version_upgrade            = true
  apply_immediately                     = var.apply_immediately
  enabled_cloudwatch_logs_exports       = ["audit", "error", "general", "slowquery"]

  tags = {
    Name = "${local.name_prefix}-primary"
  }
}

resource "aws_db_instance" "replica" {
  identifier                            = "${local.name_prefix}-replica"
  replicate_source_db                   = aws_db_instance.primary.identifier
  instance_class                        = var.db_replica_instance_class
  storage_type                          = "gp3"
  storage_encrypted                     = true
  kms_key_id                            = aws_kms_key.rds.arn
  vpc_security_group_ids                = [aws_security_group.rds.id]
  parameter_group_name                  = aws_db_parameter_group.mysql.name
  publicly_accessible                   = false
  skip_final_snapshot                   = true
  auto_minor_version_upgrade            = true
  maintenance_window                    = var.db_replica_maintenance_window
  performance_insights_enabled          = true
  performance_insights_kms_key_id       = aws_kms_key.rds.arn
  performance_insights_retention_period = 7
  monitoring_interval                   = 60
  monitoring_role_arn                   = aws_iam_role.rds_enhanced_monitoring.arn
  apply_immediately                     = var.apply_immediately

  tags = {
    Name = "${local.name_prefix}-replica"
  }
}
