# gcp region
region = "us-central1"
zone   = "us-central1-a"
# gke cluster name, this is the same name used to create the vpc and subnet
cluster_name = "asel-final"
project_id   = "final-ayimdar"


credentials_file_path = "/Users/Asus/Desktop/final/final-ayimdar-d1ecc29f5e67.json"

cidrBlock          = "10.1.0.0/16"
initial_node_count = 2
min_node_count     = 1
max_node_count     = 3
machine_type       = "e2-medium"
dns_zone_name      = "awesome-cat"