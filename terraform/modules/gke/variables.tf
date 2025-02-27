variable "project_id" {
  description = "The ID of the Google Cloud project"
  type        = string
  default     = "final-ayimdar"
}

variable "cluster_name" {
  type        = string
  description = "The name of the cluster, unique within the project and location."
}

variable "location" {
  type        = string
  description = "The location (region or zone) in which the cluster master will be created, as well as the default node location. If you specify a zone (such as us-central1-a), the cluster will be a zonal cluster with a single cluster master. If you specify a region (such as us-west1), the cluster will be a regional cluster with multiple masters spread across zones in the region, and with default node locations in those zones as well"
}

variable "initial_node_count" {
  description = "Initial number of nodes."
  type        = number
  default     = 1
}

variable "network" {
  type        = string
  description = "The name or self_link of the Google Compute Engine network to which the cluster is connected. For Shared VPC, set this to the self link of the shared network."
}

variable "subnetwork" {
  type        = string
  description = "The name or self_link of the Google Compute Engine subnetwork in which the cluster's instances are launched."
}

variable "k8s_version" {
  type        = string
  description = "kubernetes version"
  default     = "1.27"
}

variable "node_pool_name" {
  description = "Name of the node pool."
  type        = string
}

variable "min_node_count" {
  description = "Minimum number of nodes for autoscaling."
  type        = number
}

variable "max_node_count" {
  description = "Maximum number of nodes for autoscaling."
  type        = number
}

variable "machine_type" {
  description = "Machine type for nodes."
  type        = string
}

