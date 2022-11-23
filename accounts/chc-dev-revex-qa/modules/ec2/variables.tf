variable "ami_ssm_lookup_map" {
  default = {
    windows2019 = "/nimbus/gold/windows/win2019"
    }
}

variable "ami-osversion" {
  default = "windows2019"
}


variable "instance_type" {
  type = string
  #default = "r5.large"
  default = "t2.micro"
}

variable "instance_count" {
  type    = string
  default = "1"
}

variable "instance_username" {
  default = "terraform"
}

variable "sgs" {
  type = list
  default = ["sg-033bc714275f16254"]
}

variable "subnet" {
  type    = string
  default = "subnet-03518d6b927929d05"
}

variable "iam_role" {
  default = "Toolchain-Instance"
}
