variable "instance_name" {
  description = "Name of the instance to be created"
  default     = "Jupyter-backstage-demo"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "subnet_id" {
  description = "The VPC subnet the instance(s) will be created in"
  default     = "subnet-04d96445f9dc80f76"
}

variable "ami_id" {
  description = "The AMI to use for Jupyterlab"
  default     = "ami-029190e305736f9fc"
}


variable "ami_key_pair_name" {
  default = "Jupyterlab"
}

variable "security_groups_id" {
  default = ["sg-07bc0f501905f547e"]
}