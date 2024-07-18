resource "aws_instance" "edwin-worker-node" {
    ami = var.ec2_ami
    instance_type = var.ec2_instance_type
    key_name = var.ec2_key_file
    subnet_id = var.ec2_subnet_association
    vpc_security_group_ids = var.vpc_security_group_ids
    associate_public_ip_address = true
    provisioner "local-exec" {
        command = "echo 'TodoList: \"${aws_instance.edwin-worker-node.public_ip}\"' > ../Todo_List_deployments/5_todolist_worker_node_role/vars/main.yml"
    }
    tags = {
      Name = var.ec2_target_node_name
      Type = var.ec2_type_node
    }
    
}