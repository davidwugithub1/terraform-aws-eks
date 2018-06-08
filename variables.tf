variable "additional_userdata" {
  description = "Extra lines of userdata (bash) which are appended to the default userdata code."
  default     = ""
}

variable "cluster_ingress_cidrs" {
  description = "The CIDRs from which we can execute kubectl commands."
  type        = "list"
}

variable "cluster_name" {
  description = "Name of the EKS cluster which is also used as a prefix in names of related resources."
}

variable "cluster_version" {
  description = "Kubernetes version to use for the cluster."
  default     = "1.10"
}

variable "config_output_path" {
  description = "Determines where config files are placed if using configure_kubectl_session and you want config files to land outside the current working directory."
  default     = "./"
}

variable "configure_kubectl_session" {
  description = "Configure the current session's kubectl to use the instantiated cluster."
  default     = false
}

variable "ebs_optimized_workers" {
  description = "If left at default of true, will use ebs optimization if available on the given instance type."
  default     = true
}

variable "subnets" {
  description = "A list of subnets to associate with the cluster's underlying instances."
  type        = "list"
}

variable "tags" {
  description = "A map of tags to add to all resources."
  default     = {}
}

variable "vpc_id" {
  description = "VPC id where the cluster and other resources will be deployed."
}

variable "worker_groups" {
  description = "A list of maps defining worker group configurations."
  type        = "list"

  default = [
    {
      name                 = "nodes"    # Name of the worker group.
      ami_id               = ""         # AMI ID for the eks workers. If none is provided, Terraform will search for the latest version of their EKS optimized worker AMI.
      asg_desired_capacity = "1"        # Desired worker capacity in the autoscaling group.
      asg_max_size         = "3"        # Maximum worker capacity in the autoscaling group.
      asg_min_size         = "1"        # Minimum worker capacity in the autoscaling group.
      instance_type        = "m4.large" # Size of the workers instances.
    },
  ]
}
