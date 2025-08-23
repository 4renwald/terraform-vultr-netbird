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

variable "tcp_ports" {
    type        = set(string)
    description = "Set of TCP ports to open."
}

variable "udp_ports" {
    type        = set(string)
    description = "Set of UDP ports to open."
}

variable "user_data" {
    type        = string
    description = "Used to pass a custom script at execution."
}

variable "firewallgroup_name" {
  type        = string
  description = "Name of the firewall group linked to the instance."
}