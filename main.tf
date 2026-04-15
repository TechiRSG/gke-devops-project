provider "google" {
  project = "devops-gke-project-12345"
  region  = "us-central1"
}

resource "google_container_cluster" "primary" {
  name     = "my-gke-cluster"
  location = "us-central1"

  deletion_protection = false

  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "nodes" {
  name       = "my-node-pool"
  cluster    = google_container_cluster.primary.name
  location   = "us-central1"

  node_config {
    machine_type = "e2-micro"   # 👈 low resource = no failure
  }

  initial_node_count = 1
}