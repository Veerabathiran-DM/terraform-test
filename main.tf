module "gce" {
  source        = "./modules/gce-instance"
}

module "gcs" {
  source        = "./modules/gcs-bucket"
}