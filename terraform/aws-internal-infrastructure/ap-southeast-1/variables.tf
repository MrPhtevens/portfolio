variable "ftp_passive_ports" {
  default = {
    start = 50000
    end   = 51000
  }
}

variable "ad_connector_password" {
  type        = string
  description = "Password for the AD Connector"
  sensitive   = true
}
