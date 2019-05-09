provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}

module "app" {
  source = "./modules/app"
  public_key_path = "${var.public_key_path}"
  private_key_path="${var.private_key_path}"
  ssh_user="${var.ssh_user}"
  zone = "${var.zone}"
  env="${var.env}"
  db_ip="${module.db.db_internal_ip}"
}

module "db" {
  source = "./modules/db"
  env = "${var.env}"
}

module "vpc" {
  source = "./modules/vpc"
  source_ranges="0.0.0.0/0"
  rule_name="tf-allow-all-ssh"
}
