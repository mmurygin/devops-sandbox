variable env {
  description = "environment to build"
}

variable zone {
  description = "Zone"
  default     = "europe-west3-c"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable private_key_path {
  description = "Path to the private key used for ssh access"
}

variable ssh_user {
  description = "SSH user to connect to vm"
}

variable db_ip {
  description = "the ip of mongo database"
}
