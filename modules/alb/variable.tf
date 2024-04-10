variable "project_name" {
  type        = string
  description = "this takes the name of our project"
}
variable "alb_sg_id" {
  type        = string
  description = "this is the security group name of the load balancer created in the security group module"
}
variable "pub_sub_1a_id" {
  type        = string
  description = "this is the public subnets IPS created for the load balancer"
}
variable "pub_sub_2b_id" {
  type        = string
  description = "this is the public subnets IPS created for the load balancer"
}
variable "vpc_id" {
  type        = string
  description = "this is the vpc ID"
}
