
resource "google_compute_network" "vpc" {
  project                 = var.project_id
  name        = var.vpc_name
  description = var.vpc_description
  
  # the network is created in "custom subnet mode"
  # we will explicitly connect subnetwork resources below using google_compute_subnetwork resource
  auto_create_subnetworks = "false"
}


resource "google_compute_subnetwork" "subnet" {
  project       = var.project_id
  name          = var.subnet_name
  description   = var.subnet_description
  region        = var.region
  # network       = google_compute_network.vpc.id
  network       = google_compute_network.vpc.self_link
  ip_cidr_range = var.cidrBlock
}