####################################
## vultr-instance variables
####################################

variable "vultr_api_key" {
  type        = string
  description = "API key used to deploy Vultr resources."
  sensitive   = true
}

variable "cloudflare_api_token" {
  type        = string
  description = "API key used to add Cloudflare DNS record."
  sensitive   = true
}

variable "ssh_key_ids" {
  type        = list(string)
  description = "A list of SSH key IDs to apply to the server on install (only valid for Linux/FreeBSD)."
}

variable "hostname" {
  type        = string
  description = "Hostname of the NetBird instance running in Vultr."
}

variable "label" {
  type        = string
  description = "Label to assign to the Vultr instance."
}

variable "region" {
  type        = string
  description = "Vultr region code where the instance will be deployed."
}

variable "activation_email" {
  type        = bool
  description = "Whether to send the Vultr activation email."
  default     = false
}

variable "plan" {
  type        = string
  description = "Vultr plan ID for the instance size."
  default     = "vc2-1c-2gb"
}

variable "os_id" {
  type        = number
  description = "Vultr OS ID for the instance."
  default     = 2571
}

variable "ssh_allowed_ip" {
  type        = string
  description = "IP address allowed to SSH into the instance."
}

variable "firewallgroup_name" {
  type        = string
  description = "Name of the firewall group linked to the instance."
}

####################################
## cloudflare-dns-record variables
####################################

variable "dns_record_comment" {
  type        = string
  description = "Comment for the DNS record."
}

variable "domain_name" {
  type        = string
  description = "Domain name used for the DNS record."
}

variable "subdomain_name" {
  type        = string
  description = "Subdomain used for the DNS record."
}