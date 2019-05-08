resource "google_compute_instance" "db" {
  name         = "reddit-db-${var.env}"
  machine_type = "g1-small"
  zone         = "${var.zone}"

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
