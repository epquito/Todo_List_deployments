# RDS
variable "db_subnet_group_name" {
  description = "Name of the RDS DB subnet group"
  type        = string

}
variable "rds_subnet_group_ids" {
    type = list(string)
    description = "list of subnet ids"
  
}

variable "db_instance_identifier" {
  description = "Identifier for the RDS instance"
  type        = string
}

variable "db_name" {
  description = "Name of the RDS database"
  type        = string
}

variable "rds_engine" {
  description = "Identify RDS engine (PostgreSQL, MySQL, etc)"
  type = string
  
}
variable "rds_engine_version" {
  description = "Identify RDS engine version"
  type = string  
}
variable "rds_instance_class" {
  description = "Identify RDS instance class"
  type = string  
}

variable "db_username" {
  description = "Username for the RDS instance"
  type        = string
}

variable "db_password" {
  description = "Password for the RDS instance"
  type        = string
}
variable "rds_parameter_group_name" {
  description = "Identify RDS engine parameter group name"
  type = string  
}
variable "rds_security_group_ids" {
    description = "list of security group IDs"
}
