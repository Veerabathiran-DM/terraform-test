module "gcs_bucket" {
  source = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
  project_id = var.project_id

  name          = var.bucket_name
  location      = "US" 
  versioning    = true
  force_destroy = true 

  lifecycle_rules = [
    {
      action = {
        type = "SetStorageClass"
        storage_class = "ARCHIVE"
      }
      condition = {
        age = 30 
        num_newer_versions = 3
      }
    }
  ]
}

# Output the bucket name
output "bucket_name" {
  value = module.gcs_bucket.name
}
