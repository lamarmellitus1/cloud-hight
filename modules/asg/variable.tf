variable "project_name"{
    type = string
    description = "this is project name of of app."
}
variable "ami" {
    default = "ami-00c71bd4d220aa22a"
}
variable "cpu" {
    default = "t2.micro"
}
variable "key_name" {
    type = string
}
variable "client_sg_id" {
    type = string
    description = "this is the target group ID"
}
variable "max_size" {
    default = 6
}
variable "min_size" {
    default = 2
}
variable "desired_cap" {
    default = 2
}
variable "asg_health_check_type" {
    default = "ELB"
}
variable "pri_sub_3a_id" {
    type = string
    description = "private subnet 3a"
}
variable "pri_sub_4b_id" {
      type = string
    description = "private subnet 4a"
}
variable "tg_arn" {
    type = string
    description = "target group resource name"
}