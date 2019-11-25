variable "aws_region" {
  description = "AWS region on which we will setup the swarm cluster"
  default     = "us-east-1"
}

variable "aws_access_key_id" {
  description = "AWS Access Key Id"
  type        = string
}

variable "aws_secret_access_key" {
  description = "AWS Secret Access Key"
  type        = string
}

variable "ami" {
  description = "Amazon Linux AMI"
  default     = "ami-07d0cf3af28718ef8"
}

variable "instance_type" {
  description = "Instance type"
  default     = "t2.medium"
}

variable "key_path" {
  description = "SSH Public Key path"
  type        = string
}

variable "total_workers" {
  description = "total number of workers required."
  type        = number
  default     = 0
}
