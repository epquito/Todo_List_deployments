variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "environment" {
  description = "The environment for the S3 bucket"
  type        = string
}

variable "sse_algorithm" {
  description = "type of encryption"
  type        = string
}
