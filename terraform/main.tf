terraform {
  backend "gcs" {
    bucket = "bucket-final-asel"
    prefix = "terraform/state"
  }
}



provider "google" {
  # credentials = file(var.credentials_file_path)
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}



# invoking vpc and subnets modules
module "vpc_and_subnets" {
  source     = "./modules/vpc_and_subnets"
  project_id = var.project_id
  # create vpc and subnet with the same name as cluster name
  vpc_name    = var.cluster_name
  subnet_name = var.cluster_name

  # region where the resources need to be created
  region    = var.region
  zone      = var.zone
  cidrBlock = var.cidrBlock
}

# invoking gke module to create gke cluster and node group
module "google_kubernetes_cluster" {
  source             = "./modules/gke"
  node_pool_name     = var.cluster_name
  project_id         = var.project_id
  cluster_name       = var.cluster_name
  k8s_version        = var.k8s_version
  location           = var.zone
  network            = module.vpc_and_subnets.vpc_name
  subnetwork         = module.vpc_and_subnets.subnet_name
  initial_node_count = var.initial_node_count
  max_node_count     = var.max_node_count
  min_node_count     = var.min_node_count
  machine_type       = var.machine_type
}


module "google_dns_managed_zone" {
  source        = "./modules/external-dns"
  project_id    = var.project_id
  region        = var.region
  dns_zone_name = var.dns_zone_name
  dns_name      = "asel.live."
}

module "database" {
  source     = "./modules/database"
  region     = var.region
  project_id = var.project_id
  zone       = var.zone
}

