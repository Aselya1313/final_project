

output "vpc_name" {
  description = "vpc network name"
  value       = google_compute_network.vpc.name
}

output "subnet_name" {
  description = "subnet name"
  value       = google_compute_subnetwork.subnet.name
}