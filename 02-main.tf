module "VPC" {
    source = "./VPC"
    vpc_cidr_block = var.vpc_cidr_block
    vpc_tenancy = var.vpc_tenancy
    vpc_enable_dns_hostnames = var.vpc_enable_dns_hostnames
    vpc_enables_dns_support = var.vpc_enables_dns_support
    vpc_name = var.vpc_name
    vpc_igw_name = var.vpc_igw_name
    public_subnet_1_cidr_block = var.public_subnet_1_cidr_block
    public_subnet_1_name = var.public_subnet_1_name
    public_subnet_1_az = var.public_subnet_1_az
    public_subnet_2_cidr_block = var.public_subnet_2_cidr_block
    public_subnet_2_az = var.public_subnet_2_az
    public_subnet2_name = var.public_subnet2_name
    rt_cidr_block_igw = var.rt_cidr_block_igw
    rt_local_cidr_block = var.rt_local_cidr_block
    rt_local_gateway_id = var.rt_local_gateway_id
    rt_name = var.rt_name
    nacl_name = var.nacl_name
    default_sg_name = var.default_sg_name
}
module "EC2" {
    source = "./EC2"
    ec2_ami = data.aws_ami.ubuntu_22.id
    ec2_instance_type = var.ec2_instance_type
    ec2_key_file = var.ec2_key_file
    ec2_subnet_association = module.VPC.public_subnet_1
    vpc_security_group_ids = module.VPC.security_group_ids
    ec2_target_node_name = var.ec2_target_node_name
    ec2_type_node = var.ec2_type_node
}

module "RDS" {
    source = "./RDS"
    db_subnet_group_name = var.db_subnet_group_name
    rds_subnet_group_ids = module.VPC.public_subnet_group
    db_instance_identifier = var.db_instance_identifier
    db_name = var.db_name
    rds_engine =  var.rds_engine
    rds_engine_version = var.rds_engine_version
    rds_instance_class = var.rds_instance_class
    db_username = var.db_username
    db_password = var.db_password
    rds_parameter_group_name = var.rds_parameter_group_name
    rds_security_group_ids = module.VPC.security_group_ids
    depends_on = [ module.EC2 ]
}


module "S3" {
    source = "./S3"
    bucket_name = var.bucket_name
    environment = var.environment
    sse_algorithm = var.sse_algorithm
    
  
}
module "DynamoDB" {
    source = "./DynamoDB"
    dynamodb_table_name = var.dynamodb_table_name
  
}