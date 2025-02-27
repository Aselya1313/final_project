output "cluster_name" {
    value =  google_container_cluster.gke.name
    description = "The Kubernetes cluster name."
}

output "project_id" {
    value = google_container_cluster.gke.project
}

output "location" {
    value =google_container_cluster.gke.location
}

