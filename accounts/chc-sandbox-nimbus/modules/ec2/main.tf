
data "aws_ssm_parameter" "gold_ami_id" {
  name = lookup(var.ami_ssm_lookup_map, var.ami-osversion) # our Gold AMI's SSM parameter's name
}

#tag resources##
resource "aws_instance" "tf_instance" {
  count                = var.instance_count
  ami                  = data.aws_ssm_parameter.gold_ami_id.value
  instance_type        = var.instance_type
  security_groups      = var.sgs
  subnet_id            = var.subnet
  iam_instance_profile = var.iam_role
  
  tags = {
      Name        = "CIE-IAAC-${count.index}"
  }

}

