resource "google_compute_instance" "db" {
  name         = "reddit-db"
  machine_type = "g1-small"
  zone         = "${var.zone}"

  metadata {
    ssh-keys = "${var.ssh_user}:${file(var.public_key_path)}"
  }

  boot_disk {
    initialize_params {
      image = "mongodb"
    }
  }

  network_interface {
    network = "default"

    access_config = {}
  }
}
