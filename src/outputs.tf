output "ec2_instance_id" {
  description = "The ID of the instance"
  value = aws_instance.ec2_instance[0].id
}

output "ec2_instance_arn" {
  description = "The ARN of the instance"
  value = aws_instance.ec2_instance[0].arn
}
