# FIX: The original file had SIX separate module blocks (provider, vpc, subnets,
# igw, route_tables, subnets_associations) all pointing at the same source
# "./AWS_VPC" with identical inputs. This would have tried to create the entire
# VPC stack 6 times over, causing duplicate resource / CIDR collision errors.
#
# A module is the WHOLE folder (all .tf files in it) - you only need ONE
# module block to provision everything inside AWS_VPC/.

module "vpc" {
  source = "./AWS_VPC"

  project_name        = var.project_name
  availability_zone   = var.availability_zone
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}
