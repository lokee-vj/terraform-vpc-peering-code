variable "owner_id" {
  type    = string
  default = "783963507307"
}

variable "vpc_id" {
  type    = string
  default = "vpc-0a1e4b26c4b39829d"
}

variable "peer_vpc_id" {
  type    = string
  default = "vpc-0d24bbd31c9e8902a"
}

variable "peer_region" {
  default = "us-east-1"
}

variable "subnet_east1" {
  default = "subnet-03518d6b927929d05"
}

variable "subnet_peer" {
  default = "subnet-0d96d2e328eb8de10"
}

variable "route_table_1" {
  default = "rtb-0516bda7c6dcf2770"
}

variable "route_table_2" {
  default = "rtb-0d0c8df8bcdcf96fe"
}




