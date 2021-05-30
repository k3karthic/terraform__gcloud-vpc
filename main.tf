/*
 * Variables
 */

variable "region" {}

variable "uscentral1_cidr" {}

/*
 * Providers
 */

provider "google" {}

/*
 * Configuration
 */

//
// Network
//

resource "google_compute_network" "main" {
  name                            = "personal-network"
  auto_create_subnetworks         = false
  routing_mode                    = "REGIONAL"
  delete_default_routes_on_create = true
}

//
// Subnets
//

resource "google_compute_subnetwork" "uscentral1" {
  name          = "personal-network--uscentral1-subnet"
  ip_cidr_range = var.uscentral1_cidr
  region        = var.region
  network       = google_compute_network.main.id
}

//
// Route Tables
//

resource "google_compute_route" "igw" {
  dest_range       = "0.0.0.0/0"
  name             = "personal-network--igw-route"
  network          = google_compute_network.main.id
  next_hop_gateway = "default-internet-gateway"
}


//
// Firewall
//

resource "google_compute_firewall" "main" {
  name    = "personal-network--firewall-main"
  network = google_compute_network.main.id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags = [
    "public"
  ]
}

resource "google_compute_firewall" "shadowsocks" {
  name    = "personal-network--firewall-shadowsocks"
  network = google_compute_network.main.id

  allow {
    protocol = "tcp"
    ports    = ["8388"]
  }

  target_tags = [
    "shadowsocks"
  ]
}
