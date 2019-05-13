resource "google_compute_instance" "db" {
  name         = "reddit-db-${var.env}-1"
  machine_type = "g1-small"
  zone         = "${var.zone}"

  tags = ["reddit-db-${var.env}"]

  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
    }
  }

  network_interface {
    network = "default"

    access_config = {}
  }
}
