variable "db_sg_id" {
  type        = string
  description = "this is the sg for the database"
}
variable "pri_sub_5a_id" {
  type        = string
  description = "this is a private subnet attached to the database"
}
variable "pri_sub_6b_id" {
  type        = string
  description = "this is a private subnet attached to the database"
}
variable "db_username" {
  type        = string
  default  = "admin"
}
variable "db_password" {
type = string
default = "mellitus"
sensitive = true
}
variable "db_sub_name" {
  default = "interview-ch-db-subnet"
}
variable "db_name" {
  default = "testdb"
}
