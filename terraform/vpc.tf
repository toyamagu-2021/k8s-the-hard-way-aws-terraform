module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true
}

# We can configure Pod Network Rouutes either by:
# 1. By VPC Subnet Route (AWS)
#    - https://github.com/prabhatsharma/kubernetes-the-hard-way-aws/blob/master/docs/11-pod-network-routes.md
#    - comment out below lines
# 2. By adding ip route (Pure linux feature)
#    - https://github.com/kelseyhightower/kubernetes-the-hard-way/blob/master/docs/11-pod-network-routes.md
# But note that we should set `source_dest_check = false`.
# resource "aws_route" "node_0" {
#   route_table_id         = module.vpc.private_route_table_ids[0]
#   network_interface_id   = module.node_0.primary_network_interface_id
#   destination_cidr_block = "10.200.0.0/24"
# }

# resource "aws_route" "node_1" {
#   route_table_id         = module.vpc.private_route_table_ids[0]
#   destination_cidr_block = "10.200.1.0/24"
#   network_interface_id   = module.node_1.primary_network_interface_id
# }
