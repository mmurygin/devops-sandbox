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

variable env {
  description = "environment to build"
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

variable app_vm_image {
  description = "The image for app vm"
  default     = "centos-7"
}

variable db_vm_image {
  description = "The image for db vm"
  default     = "centos-7"
}
