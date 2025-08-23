variable "dns_record_comment" {
    type        = string
    description = "Comment for the DNS record."
}

variable "dns_record_ip" {
    type        = string
    description = "IP address used for the DNS record."
}

variable "domain_name" {
  type        = string
  description = "Domain name used for the DNS record."
}

variable "subdomain_name" {
    type        = string
    description = "Subdomain used for the DNS record."
}