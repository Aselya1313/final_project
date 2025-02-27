# Create a DNS Managed Zone
resource "google_dns_managed_zone" "primary" {
  name        = var.dns_zone_name
  dns_name    = var.dns_name
  description = "Managed zone for ${var.dns_name}"
  visibility = "public"
}

