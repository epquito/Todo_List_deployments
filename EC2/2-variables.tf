variable "ec2_ami" {
    description = "AMI image for ec2 server"
    type = string
  
}
variable "ec2_instance_type" {
    description = "ec2 instance type"
    type = string
  
}
variable "ec2_key_file" {
    description = "ec2 pem key file to ssh "
    type = string
  
}
variable "ec2_subnet_association" {
    description = "attach subnet id"
  
}
variable "vpc_security_group_ids" {
    description = "list of vpc security groups"
    
  
}
variable "ec2_target_node_name" {
    description = "ec2 name that will populate on the AWS console"
    type = string
}
variable "ec2_type_node" {
    description = "Filter out master or worker nodes for dynamic inventory using ansible"
    type = string
}