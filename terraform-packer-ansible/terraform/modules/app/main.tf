resource "google_compute_address" "app_ip" {
  name = "reddit-app-ip-${var.env}"
}

data "template_file" "reddit_env" {
  template = "${file("${path.module}/files/reddit.env")}"

  vars = {
    database_url = "${var.db_ip}:27017"
  }
}

resource "google_compute_instance" "app" {
  name         = "reddit-app-${var.env}-1"
  machine_type = "g1-small"
  zone         = "${var.zone}"

  tags = ["reddit-app-${var.env}"]

  metadata {
    ssh-keys = "${var.ssh_user}:${file(var.public_key_path)}"
  }

  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
    }
  }

  network_interface {
    network = "default"

    access_config = {
      nat_ip = "${google_compute_address.app_ip.address}"
    }
  }

  connection {
    type        = "ssh"
    user        = "${var.ssh_user}"
    agent       = false
    private_key = "${file(var.private_key_path)}"
  }

  provisioner "file" {
    content     = "${data.template_file.reddit_env.rendered}"
    destination = "/tmp/reddit.env"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo cp /tmp/reddit.env /etc/default/reddit.env",
      "systemctl list-unit-files | grep reddit && sudo systemctl restart reddit || echo nothing to start"
    ]
  }
}

resource "google_compute_firewall" "default" {
  name    = "allow-reddit-app-${var.env}"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]

  target_tags = ["reddit-app-${var.env}"]
}
