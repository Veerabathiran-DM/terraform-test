module "gce_instance" {
  source  = "terraform-google-modules/vm/google"
  version = "~> 4.0" # Use a specific version

  project_id = "your-project-id"
  zone       = "us-central1-a"
  name       = "my-instance"
  machine_type = "e2-medium"
  network = "default"
  subnetwork = "default"

  tags = ["web", "dev"]

  boot_disk = {
    initialize_params = {
      image = "debian-cloud/debian-11"
    }
  }

  network_interfaces = [{
    network    = "default"
    subnetwork = "default"
    access_config = {} # Assigns an external IP
  }]

  service_account = {
    email  = "your-service-account@your-project-id.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}

output "instance_ip" {
  value = module.gce_instance.network_interfaces[0].access_config[0].nat_ip
}