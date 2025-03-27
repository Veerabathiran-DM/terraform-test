terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.27.0"
    }
  }
}

provider "google" {
  project = "poc-ad-target-env-413614"
  region = "us-central1"
}