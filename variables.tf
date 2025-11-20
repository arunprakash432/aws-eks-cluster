variable "kubernetes_version" {
  type        = string
  default     = "1.33"
  description = "Kubernetes version for the EKS control plane (string, e.g. \"1.27\")"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "default CIDR range of the VPC"
}

variable "aws_region" {
  type        = string
  default     = "ap-south-1"
  description = "aws region"
}
