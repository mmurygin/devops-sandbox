resource "google_compute_address" "app_ip" {
  name = "reddit-app-ip"
}

data "template_file" "reddit_env" {
  template = "${file("reddit/reddit.env")}"

  vars = {
    database_url = "${google_compute_instance.db.network_interface.0.address}"
  }
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
      image = "reddit"
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
      "sudo cp /tmp/reddit.env /etc/default/reddit",
      "sudo systemctl enable --now reddit",
    ]
  }

  depends_on = [
    "google_compute_firewall.firewall_ssh",
  ]
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
