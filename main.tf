provider "aws" {
    region = "ap-south-1"
    version = "~> 6.0"    
}

data "aws_availability_zones" "azs" {
    state = "available"
}

module "eks"{
    source = "terraform-aws-modules/eks/aws"
    version = "~> 21.0"
    cluster_name = local.cluster_name
    cluster_version = "1.33"
    subnets = module.vpc.private_subnets
tags = {
        Name = "Practice-EKS-Cluster"
    }
vpc_id = module.vpc.vpc_id
    workers_group_defaults = {
        root_volume_type = "gp3"
    }
worker_groups = [
        {
            name = "Worker-Group-1"
            instance_type = "t3.small"
            asg_desired_capacity = 2
            additional_security_group_ids = [aws_security_group.worker_group_one.id]
        },
        {
            name = "Worker-Group-2"
            instance_type = "t3.small"
            asg_desired_capacity = 1
            additional_security_group_ids = [aws_security_group.worker_group_two.id]
        },
    ]
}

data "aws_eks_cluster" "cluster" {
    name = module.eks.cluster_id
}
data "aws_eks_cluster_auth" "cluster" {
    name = module.eks.cluster_id
}