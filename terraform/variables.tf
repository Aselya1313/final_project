variable "region" {
  type        = string
  description = "gcp region where the resources are being created"
  default     = "us-central1"
}

variable "cluster_name" {
  type        = string
  description = "gke cluster name, same name is used for vpc and subnets"
  default     = "cluster-september"
}




variable "k8s_version" {
  type        = string
  description = "k8s version"
  default     = "1.27"
}

variable "project_id" {
  type        = string
  description = "Google Cloud Platform project ID"
}

variable "zone" {
  type        = string
  description = "Google Cloud zone"
}

variable "credentials_file_path" {
  type = string
}



variable "cidrBlock" {
  type        = string
  description = "The cidr block for subnet"
  default     = "10.1.0.0/16"
}



variable "initial_node_count" {
  type        = number
  description = "Initial number of nodes in the cluster"
  default     = 1
}

variable "max_node_count" {
  type        = number
  description = "Maximum number of nodes in the node pool"
  default     = 3
}

variable "min_node_count" {
  type        = number
  description = "Minimum number of nodes in the node pool"
  default     = 1
}

variable "machine_type" {
  type        = string
  description = "Machine type for the nodes in the node pool"
  default     = "e2-medium"
}

variable "dns_zone_name" {
  type        = string
  description = "Name of the DNS zone"
}

