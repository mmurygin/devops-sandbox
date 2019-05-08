provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}

resource "google_compute_instance" "app" {
  name         = "reddit-app"
  machine_type = "g1-small"
  zone         = "${var.zone}"

  tags = ["reddit-app"]

  metadata {
    ssh-keys = "${var.ssh_user}:${file(var.public_key_path)}"
  }

  boot_disk {
    initialize_params {
      image = "reddit-base"
    }
  }

  network_interface {
    network       = "default"
    access_config = {}
  }

  connection {
    type        = "ssh"
    user        = "${var.ssh_user}"
    agent       = false
    private_key = "${file(var.private_key_path)}"
  }

  provisioner "file" {
    source      = "files/reddit.service"
    destination = "/tmp/reddit.service"
  }

  provisioner "remote-exec" {
    script = "files/build.sh"
  }

  depends_on = [
    "google_compute_firewall.firewall_ssh"
  ]
}

resource "google_compute_firewall" "firewall_ssh" {
  name    = "default-allow-ssh"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "default" {
  name    = "allow-reddit-app"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]

  target_tags = ["reddit-app"]
}
