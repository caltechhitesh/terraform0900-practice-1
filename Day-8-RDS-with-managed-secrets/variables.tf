variable "db_password" {
  description = "Master password for the RDS instance. Do not commit real passwords."
  type        = string
  sensitive   = true
}
