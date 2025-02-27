resource "google_container_cluster" "gke" {
  project            = var.project_id
  name               = var.cluster_name
  location           = var.location
  # min_master_version = local.master_version

  release_channel {
    channel = "UNSPECIFIED"
  }

  remove_default_node_pool = true
  initial_node_count       = var.initial_node_count

  network    = var.network
  subnetwork = var.subnetwork
  network_policy {
    enabled = true
   }
   
  logging_service     = "logging.googleapis.com/kubernetes"
  monitoring_service  = "monitoring.googleapis.com/kubernetes"

}


# self managed nodepool
# official documentation - https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool
resource "google_container_node_pool" "nodepools" {
  project = var.project_id
  name       = var.cluster_name
  location   = var.location
  cluster    = var.cluster_name
  node_count = var.initial_node_count

  autoscaling {
    min_node_count =  var.min_node_count
    max_node_count = var.max_node_count
  }

  management {
    auto_repair  = true
    auto_upgrade = false
  }

  node_config {
     machine_type   = var.machine_type
     disk_size_gb   = 50
  }

  lifecycle {
    ignore_changes = [
      initial_node_count,
      node_count,
      node_config,
      node_locations
    ]
  }

  
  depends_on = [google_container_cluster.gke]
}