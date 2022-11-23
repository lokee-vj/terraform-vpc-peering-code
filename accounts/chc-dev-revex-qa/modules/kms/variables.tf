variable "deletion_window" {
  type    = string
  default = "10"
}

variable "key_usage" {
  type    = string
  default = "ENCRYPT_DECRYPT"
}

variable "description" {
  type = string
  default = "kms key"
}

variable "key_spec" {
  type = string
  default = "SYMMETRIC_DEFAULT"
}


