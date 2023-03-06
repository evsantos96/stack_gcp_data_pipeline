provider "google" {
  project = var.project_id
  region  = var.region
}

terraform {
  backend "gcs" {
    credentials = "${{ secrets.GOOGLE_CREDENTIALS }}"
    bucket = "stack-state-gcs-data-pipeline68752"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.67.0"
    }
  }
}