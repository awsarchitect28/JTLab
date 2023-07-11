resource "aws_instance" "ec2_instance" {
  count           = 1
  ami             = var.ami_id
  subnet_id       = var.subnet_id
  instance_type   = var.instance_type
  key_name        = var.ami_key_pair_name
  security_groups = var.security_groups_id
  user_data       = data.template_file.user_data.rendered
  # root disk
  root_block_device {
    volume_size           = "10"
    volume_type           = "gp2"
    encrypted             = false    
    delete_on_termination = true
  }
  
  lifecycle {
    ignore_changes = all
  }

  tags = {
    Name = "Jupyter-backstage-demo"
    Env  = "Test"
  }
} 
