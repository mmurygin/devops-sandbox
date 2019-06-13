provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}

resource "google_compute_instance" "app" {
  name         = "reddit-app-docker-monolith"
  machine_type = "g1-small"
  zone         = "${var.zone}"

  tags = ["reddit-app-docker-monolith"]

  boot_disk {
    initialize_params {
      image = "docker-vm"
    }
  }

  metadata {
    ssh-keys = "${var.ssh_user}:${file(var.public_key_path)}"
  }

  connection {
    type        = "ssh"
    user        = "${var.ssh_user}"
    agent       = false
    private_key = "${file("${var.private_key_path}")}"
  }

  network_interface {
    network       = "default"
    access_config = {}
  }

  provisioner "remote-exec" {
    inline = [
      "sudo docker container run -d -p 9292:9292 --restart on-failure muryginm/reddit:latest",
    ]
  }
}

resource "google_compute_firewall" "default" {
  name    = "allow-reddit-docker-app"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }

  source_ranges = ["0.0.0.0/0"]

  target_tags = ["reddit-app-docker-monolith"]
}
