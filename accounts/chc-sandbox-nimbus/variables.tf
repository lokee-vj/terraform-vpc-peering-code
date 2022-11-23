variable "account_id" {
  type    = string
  default = "822825227953"
}

variable "account_type" {
  type    = string
  default = "nonprod"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "appid_tag" {
  description = "App ID tag"
  default     = "999"
}

variable "team_tag" {
  description = "Team tag"
  default     = "cie-iaac"
}

#tag##
variable "appname_tag" {
  description = "App Name tag"
  default     = "TFE testing"
}
