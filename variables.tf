variable "env" {
  description = "Environment name"
  type        = string
}

variable "azs" {
  description = "Availibility zones to deploy auto scaling group in"
  type        = list(string)
}

variable "min_size" {
  description = "Minimum number of instance to deploy"
  type        = number
}

variable "max_size" {
  description = "Maximum number of instance to deploy"
  type        = number
}

variable "desired_size" {
  description = "Desired number of instance"
  type        = number
}

variable "load_balancers" {
  description = "Enter the load balancers to attach to the ASG"
  type        = list(string)
}

variable "ami_id" {
  description = "Ami id for the instance"
  type        = string
}

variable "instance_type" {
  description = "Type of the instance"
  type        = string
  default     = "t2.micro"
}

variable "security_group_ids" {
  description = "Security group names for ec2 instance"
  type        = list(string)
}

variable "user_data" {
  description = "User data for ec2 instance"
  type        = string
}

variable "vpc_zone_identifier" {
  description = "Subnet id to lauch ec2 in"
  type        = list(string)
}


variable "alb_arn" {
  description = "Arn for loab balancer"
  type = string
}
# lb lb lb ----------------------------------------------

variable "lb_security_groups" {
  description = "Security groups for load balancers"
}

