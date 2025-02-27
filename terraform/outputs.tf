
output "configure_kubectl_command_for_cluster" {
  value = "gcloud container clusters get-credentials ${module.google_kubernetes_cluster.cluster_name} --zone ${module.google_kubernetes_cluster.location} --project ${module.google_kubernetes_cluster.project_id}"
  description = "Command to configure kubectl for the Kubernetes cluster."
}

output "db_instance_address" {
  value       = module.database.db_instance_address
  description = "The address of the database instance."
}
