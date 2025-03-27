terraform {
  backend "gcs" {
    bucket = "terraform_trining_state"
    prefix = "tf-state"
  }
}