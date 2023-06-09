variable "region" {
  default = "us-east-1"
}

variable "vpc_name" {
  default = "demo"
  type = string
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
  type = string
}

variable "vpc_azs" {
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
  type        = list(string)
}

variable "vpc_private_subnets" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
  type        = list(string)
}

variable "vpc_public_subnets" {
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
  type        = list(string)
}

variable "vpc_enable_nat_gateway" {
  default = true
  type        = bool
}

variable "vpc_tags" {
  default = {
    Terraform   = "true"
    Environment = "development"
  }
}

variable "instances" {
  type = map
  default     = {
    testing-dev = {
      instance_count          = 1,
      instance_type           = "t3.micro",
      environment             = "dev"
    },
    testing-stage = {
      instance_count          = 1,
      instance_type           = "t3.micro",
      environment             = "test"
    }
  }
}

variable "ami" {
  default = "ami-0015a39e4b7c0966f"
  type        = string
}

variable "ins_name" {
  default = "demo"
  type = string
}
variable "env_name" {
  default             = "dev"
}

# variable "volumes" {
#   type = map(object({
#     size              = string
#     availability_zone = string
#   }))
#   default = {
#     "testing-dev" = {
#       size              = "10"
#       availability_zone = "us-east-1a"
#     },
#     "Worker1" = {
#       size              = "200"
#       availability_zone = "us-east-1b"
#     },
#     "Worker2" = {
#       size              = "200"
#       availability_zone = "us-east-1c"
#     }
#   }
# }

variable "volumes" {
  type = map(object({
    size              = string
    availability_zone = string
  }))
  default = {
    "testing-dev" = {
      size              = "10"
      availability_zone = "us-east-1a"
    },
    "testing-stage" = {
      size              = "200"
      availability_zone = "us-east-1b"
    }
  }
}