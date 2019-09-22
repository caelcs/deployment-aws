variable "aws_key_pair_id" {
  description = "AWS Access Key Pair Id"
  type        = string
}

variable "ami" {
  description = "Amazon Linux AMI"
  type        = string
}

variable "total_workers" {
  description = "Number of worker instances"
  type        = number
  default     = 0
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "bootstrap_path" {
  description = "Script to install Docker Engine"
  default     = "./install-docker.sh"
}

variable "aws_security_group_ids" {
  description = "Clusger Security Group Ids"
  type        = list(string)
}

variable "aws_elb_id" {
  description = "Aws ELB Id to be attach to"
  type        = string
}
