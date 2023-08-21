variable "default_aws_region" {
  type    = string
  default = "ap-northeast-1"
}
variable "aws_profile" {
  type = string
}

variable "key_pair_name" {
  type = string
}

# ================================
# Should not change variable below
variable "cron_start" {
  type        = string
  default     = "0 0 0 ? * MON-FRI *"
  description = "daily start at 07:00 AM VN time"
}

variable "cron_stop" {
  type        = string
  default     = "0 12 ? * MON-FRI *"
  description = "daily start at 17:00 PM VN time"
}

variable "cidr_blocks" {
  type    = list(string)
  default = ["118.69.72.236/32"]
}
variable "ec2_instance_type" {
  type    = string
  default = "t2.micro"
}