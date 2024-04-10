variable "ami" {
  type    = string
  default = "ami-00c71bd4d220aa22a"
}

variable "key_name" {

  description = "this is the name of the keypair for ssh"
}

variable "sg_id" {
  type        = string
  description = "this is the security group created for publ"
}

variable "pub-sub-1a" {
  type        = string
  description = "this is the pub sub 1a"
}
