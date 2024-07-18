# Create DynamoDB table for state locking
resource "aws_dynamodb_table" "tf_state_locks" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  point_in_time_recovery {
    enabled = false
  }
  tags = {
    Name = var.dynamodb_table_name
  }
}