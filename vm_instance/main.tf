resource "google_compute_instance" "instance" {
  allow_stopping_for_update = var.instance_allow_stopping_for_update
  name                      = var.instance_name
  machine_type              = var.instance_machine_type
  zone                      = var.instance_zone
  service_account {
    email  = var.instance_service_account_email
    scopes = var.instance_service_account_scopes
  }
  boot_disk {
    initialize_params {
      image = var.instance_boot_disk_image
      type  = var.instance_boot_disk_type
      size  = var.instance_boot_disk_size
    }
  }
  network_interface {
    network    = var.instance_network
    subnetwork = var.instance_subnetwork
  }
  metadata_startup_script = <<-EOF
  #
  sudo apt-get install apt-transport-https ca-certificates gnupg -y
  echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
  curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
  sudo apt-get update -y && sudo apt-get install google-cloud-cli -y

  sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin -y

  sudo apt-get install kubectl -y
  EOF
}