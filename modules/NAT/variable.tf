variable "pub_sub_1a_id" {
  type        = string
  description = "this is the public subnet ID in availablity zone 1A "
}
variable "pub_sub_2b_id" {
  type        = string
  description = "this is the public subnet ID in availablity zone 2B "
}
variable "pri_sub_3a_id" {
  type        = string
  description = "this is the public subnet ID in availablity zone 3A "
}
variable "pri_sub_4b_id" {
  type        = string
  description = "this is the public subnet ID in availablity zone 4B "
}
variable "pri_sub_5a_id" {
  type        = string
  description = "this is the public subnet ID in availablity zone 5A "
}
variable "pri_sub_6b_id" {
  type        = string
  description = "this is the public subnet ID in availablity zone 6B "
}
variable "igw_id" {
  type        = string
  description = "this is the internet gateway ID created in the vpc module "
}
variable "vpc_id" {
  type        = string
  description = "this is the vpc ID created in the vpc module"

}
