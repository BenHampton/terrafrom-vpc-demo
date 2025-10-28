variable "instance" {
  description = "EC2 instance type"
}

variable "subnet_id" {
  description = "EC2 subnet id"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "List of security group IDs to associate with the EC2 instance"
}