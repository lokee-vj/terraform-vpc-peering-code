#Account/owner ID
variable "owner_id" {
  type    = string
  default = "035806608812"
}

#requester vpc id
variable "requester_vpc_id" {
  type    = string
  default = "vpc-0997fa60fdb56a618"
}

#accepter vpc id
variable "accepter_vpc_id" {
  type    = string
  default = "vpc-0b06ee992cef0c634"
}

#vpc peering region
variable "peer_region" {
  default = "us-east-1"
}

#add requester subnetid
variable "requester_subnetid" {
  default = "subnet-08c39f04821ba8e9d"
}

#add accepter subnetid
variable "accepter_subnetid" {
  default = "subnet-0591372ee0ef8e11a"
}






