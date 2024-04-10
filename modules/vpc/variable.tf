variable "vpc_cidr" {
  type = string
  description = "this is the rang value of the vpc"
}

variable "project_name" {
  type = string
  description = "this is the name of the project"
}
variable "pub_sub_1a_cidr" {
    type = string
    description = "this is the subnet range of the subnet in availability zone 1A"
}
variable "pub_sub_2b_cidr" {
    type = string
    description = "this is the subnet range of the subnet in availability zone 1B" 
}
variable "cloudhight-private_sub_3a_cidr" {
     type = string
    description = "this is the subnet range of the subnet in availability zone 3A" 
}
variable "pri_sub_4b_cidr" {
 type = string
    description = "this is the subnet range of the subnet in availability zone 4B" 
}
variable "pri_sub_5a_cidr" {
     type = string
    description = "this is the subnet range of the subnet in availability zone 5A" 
}
variable "pri_sub_6b_cidr" {
     type = string
    description = "this is the subnet range of the subnet in availability zone 6B" 
}