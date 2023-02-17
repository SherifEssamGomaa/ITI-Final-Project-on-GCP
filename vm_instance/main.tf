resource "google_compute_instance" "instance" {
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
      size  = var.instance_boot_disk_size
    }
  }

  metadata_startup_script = var.instance_meta_data

  # metadata_startup_script = <<-EOF
  #                                   #
  #                                   sudo apt-get install -y apt-transport-https ca-certificates gnupg
  #                                   echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
  #                                   curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
  #                                   sudo apt-get update -y && sudo apt-get install -y google-cloud-cli
  #                                   sudo apt-get install -y google-cloud-cli-gke-gcloud-auth-plugin
  #                                   sudo apt-get update -y
  #                                   sudo apt-get install -y ca-certificates curl
  #                                   sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
  #                                   echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
  #                                   sudo apt-get update -y
  #                                   sudo apt-get install -y kubectl
  #                                EOF

  network_interface {
    network    = var.instance_network
    subnetwork = var.instance_subnetwork
  }
}