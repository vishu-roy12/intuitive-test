module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    version = "v5.0.0"

    name = var.vpc_name
    cidr = var.vpc_cidr

    azs = var.vpc_azs
    private_subnets = var.vpc_private_subnets
    public_subnets = var.vpc_public_subnets

    enable_nat_gateway = var.vpc_enable_nat_gateway

    tags = var.vpc_tags
}

module "ec2_instances" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "v5.1.0"
  
  for_each = var.instances
  ami                    = var.ami
  instance_type           = each.value.instance_type
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Name        = "${each.key}.${var.ins_name}"
    Terraform   = "true"
    Environment = var.env_name
  }
}

resource "aws_ebs_volume" "partition" {
      for_each          = var.volumes
      availability_zone = each.value.availability_zone
      size              = each.value.size
    }

resource "aws_volume_attachment" "ebs_att" {
  for_each    = aws_ebs_volume.partition
  device_name = contains(["testing-dev", "testing-stage"], each.key) ? "/dev/sdf" : "/dev/sdg"
  volume_id   = each.value.id
  instance_id = module.ec2_instances[each.key].id
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "intuitive-test-buc"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}