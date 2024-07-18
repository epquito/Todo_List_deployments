# Create a DB subnet group
resource "aws_db_subnet_group" "db-subnet-group" {
  name       = var.db_subnet_group_name
  subnet_ids = var.rds_subnet_group_ids
}

# Create an RDS instance
resource "aws_db_instance" "todolistDatabase" {
  allocated_storage      = 20
  identifier             = var.db_instance_identifier
  db_name                = var.db_name
  engine                 = var.rds_engine
  engine_version         = var.rds_engine_version
  instance_class         = var.rds_instance_class
  username               = var.db_username
  password               = var.db_password
  parameter_group_name   = var.rds_parameter_group_name
  publicly_accessible    = true
  skip_final_snapshot    = true
  deletion_protection    = false
  vpc_security_group_ids = var.rds_security_group_ids

  db_subnet_group_name   = aws_db_subnet_group.db-subnet-group.name
  provisioner "local-exec" {
    command = "echo 'MYSQL_DATABASE_HOST: \"${aws_db_instance.todolistDatabase.endpoint}\"' >> ../Todo_List_deployments/5_todolist_worker_node_role/vars/main.yml"
  }
}




