module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.9.0"

  # renamed in v21: use `name` and `kubernetes_version`
  name               = local.cluster_name
  kubernetes_version = var.kubernetes_version

  # subnets for worker nodes
  subnet_ids = module.vpc.private_subnets

  enable_irsa = true

  tags = {
    cluster = "demo"
  }

  vpc_id = module.vpc.vpc_id

  # node groups: put node defaults inside each node group for v21
  eks_managed_node_groups = {
    node_group = {
      # per-node-group settings (previously could be placed under defaults)
      name = "practice-node-group-1"  # one of the module/AWS-supported values
      instance_types = ["t3.small"]
      vpc_security_group_ids = [aws_security_group.all_worker_mgmt.id]

      min_size     = 2
      max_size     = 6
      desired_size = 2
    }
  }
}
