variable "vpc_cidr_block" {
    description = "Identify full scope network range"
    type = string
  
}
variable "vpc_tenancy" {
    description = "Idetify network speed"
    type = string
  
}
variable "vpc_enable_dns_hostnames" {
    description = "Enable dns is essential for other resources"
    type = bool
  
}
variable "vpc_enables_dns_support" {
    description = "Enables dns support"
    type = bool
  
}
variable "vpc_name" {
    description = "Name of vpc that will populate within AWS console"
    type = string
  
}
variable "vpc_igw_name" {
    description = "Name the IGW within  VPC"
    type = string
  
}
variable "public_subnet_1_cidr_block" {
    description = "Sub-range within the full scope of the vpc"
    type = string
  
}
variable "public_subnet_1_name" {
    description = "name of subnet"
    type = string
  
}
variable "public_subnet_1_az" {
    description = "subnet AZ"
    type = string
  
}
variable "public_subnet_2_az" {
    description = "subnet AZ"
    type = string
  
}

variable "public_subnet_2_cidr_block" {
    description = "Sub-range within the full scope of the vpc"
    type = string
  
}
variable "public_subnet2_name" {
    description = "Name of subnet"
    type = string
  
}
variable "rt_cidr_block_igw" {
    description = "range allowed within vpc from internet traffic"
    type = string
  
}
variable "rt_local_cidr_block" {
    description = "range of the vpc network "
    type = string
  
}
variable "rt_local_gateway_id" {
    description = "identify what gw to open"
    type = string
  
}
variable "rt_name" {
    description = "route table name"
    type = string
  
}
variable "nacl_name" {
    description = "network access control list"
    type = string
  
}
variable "default_sg_name" {
    description = "default security group name"
    type = string
  
}
