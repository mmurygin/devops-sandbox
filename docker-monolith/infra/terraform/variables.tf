variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west3"
}

variable zone {
  description = "Zone"
  default     = "europe-west3-c"
}

variable private_key_path {
  description = "private key path"
  default     = "~/.ssh/id_rsa"
}

variable public_key_path {
  description = "public key path"
  default     = "~/.ssh/id_rsa.pub"
}

variable ssh_user {
  description = "User to connect by ssh"
}
