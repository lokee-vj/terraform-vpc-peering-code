terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  required_version = ">= 0.14.9"
}

terraform {
  backend "s3" {
    bucket = "cie-chc-sandbox-nimbus"
    key    = "example-terraform-ec2/cieops-state-files/"
    region = "us-east-1"
  }
}


provider "aws" {
  region = var.region
  default_tags {
    tags = {
      APP_ID      = var.appid_tag
      TEAM        = var.team_tag
      APP_NAME    = var.appname_tag
      ACCOUNT_TYPE  = var.account_type
    }
  }
}

locals {
  current_timestamp = timestamp()
  date_time_stamp   = formatdate("YYYYMMDD-hhmmss", local.current_timestamp)
}

#module "tf_ec2_instance" {
  #source = "./modules/ec2"
#}

module "tf_vpc_peering" {
  source = "./modules/vpc"
}

#/*
#module "tf_kms_key" {
  #source = "./modules/kms"
#}*/
