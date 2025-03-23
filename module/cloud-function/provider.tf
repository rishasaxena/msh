terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.8.0"
    }
  }
}

provider "google" {
  project     = "calm-bliss-454519-i0"#var.project_id
  region      = "us-central1"#var.region
  zone        = "us-central1-c"#var.zone
}