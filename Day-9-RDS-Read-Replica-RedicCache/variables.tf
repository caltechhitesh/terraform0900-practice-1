variable "aws_region" {
  description = "AWS region for all resources."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name prefix for resources."
  type        = string
  default     = "prodapp"
}

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "prod"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.10.0.0/16"
}

variable "database_subnet_cidrs" {
  description = "CIDR blocks for private RDS subnets across at least two Availability Zones."
  type        = list(string)
  default     = ["10.10.11.0/24", "10.10.12.0/24"]

  validation {
    condition     = length(var.database_subnet_cidrs) >= 2
    error_message = "At least two database subnet CIDR blocks are required for production RDS."
  }
}

variable "cache_subnet_cidrs" {
  description = "CIDR blocks for private ElastiCache subnets across at least two Availability Zones."
  type        = list(string)
  default     = ["10.10.21.0/24", "10.10.22.0/24"]

  validation {
    condition     = length(var.cache_subnet_cidrs) >= 2
    error_message = "At least two cache subnet CIDR blocks are required for production ElastiCache."
  }
}

variable "allowed_cidr_blocks" {
  description = "CIDR blocks allowed to reach MySQL and Redis."
  type        = list(string)
  default     = ["10.0.0.0/8"]
}

variable "apply_immediately" {
  description = "Whether RDS and ElastiCache changes should be applied immediately."
  type        = bool
  default     = false
}

variable "log_retention_days" {
  description = "CloudWatch log retention period in days."
  type        = number
  default     = 30
}

variable "db_engine_version" {
  description = "RDS MySQL engine version."
  type        = string
  default     = "8.0.35"
}

variable "db_instance_class" {
  description = "Primary RDS instance class."
  type        = string
  default     = "db.t3.medium"
}

variable "db_replica_instance_class" {
  description = "Read replica instance class."
  type        = string
  default     = "db.t3.small"
}

variable "db_allocated_storage" {
  description = "Allocated storage for the primary RDS instance in GiB."
  type        = number
  default     = 100
}

variable "db_max_allocated_storage" {
  description = "Maximum storage that can be autoscaled for the RDS instance in GiB."
  type        = number
  default     = 500
}

variable "db_backup_retention_period" {
  description = "Number of days to retain automated RDS backups."
  type        = number
  default     = 30
}

variable "db_backup_window" {
  description = "Preferred daily RDS backup window in UTC."
  type        = string
  default     = "03:00-04:00"
}

variable "db_maintenance_window" {
  description = "Preferred weekly RDS primary maintenance window in UTC."
  type        = string
  default     = "sun:04:00-sun:05:00"
}

variable "db_replica_maintenance_window" {
  description = "Preferred weekly RDS replica maintenance window in UTC."
  type        = string
  default     = "sun:05:00-sun:06:00"
}

variable "db_name" {
  description = "Initial database name."
  type        = string
  default     = "appdb"
}

variable "db_username" {
  description = "Master username for the RDS instance."
  type        = string
  default     = "adminuser"
}

variable "db_password" {
  description = "Master password for the RDS instance. Use tfvars, environment variables, or a secrets workflow instead of committing real values."
  type        = string
  sensitive   = true
}

variable "redis_engine_version" {
  description = "ElastiCache Redis engine version."
  type        = string
  default     = "7.0"
}

variable "redis_node_type" {
  description = "ElastiCache Redis node type."
  type        = string
  default     = "cache.t3.small"
}

variable "redis_num_cache_clusters" {
  description = "Number of cache clusters in the Redis replication group."
  type        = number
  default     = 2

  validation {
    condition     = var.redis_num_cache_clusters >= 2
    error_message = "At least two cache clusters are required when automatic failover is enabled."
  }
}

variable "redis_auth_token" {
  description = "Auth token for Redis transit encryption. Use tfvars, environment variables, or a secrets workflow instead of committing real values."
  type        = string
  sensitive   = true
}

variable "redis_maintenance_window" {
  description = "Preferred weekly Redis maintenance window in UTC."
  type        = string
  default     = "sun:06:00-sun:07:00"
}

variable "redis_snapshot_retention_limit" {
  description = "Number of days to retain Redis automatic snapshots."
  type        = number
  default     = 7
}

variable "redis_snapshot_window" {
  description = "Preferred daily Redis snapshot window in UTC."
  type        = string
  default     = "02:00-03:00"
}
