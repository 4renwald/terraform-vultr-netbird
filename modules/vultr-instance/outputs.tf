# output "instance_ip" {
#   description = "Public IPv4 address of the Vultr instance."
#   value       = vultr_instance.instance.main_ip
# }

# output "username" {
#   description = "Username for the Vultr instance."
#   value       = "linuxuser"
# }

# output "password" {
#   description = "Password for the Vultr instance."
#   value       = nonsensitive(vultr_instance.instance.default_password)
# }

# output "login" {
#   description = "Login for the Vultr instance."
#   value       = "ssh linuxuser@${vultr_instance.instance.main_ip} -i <PATH_TO_SSH_KEY>"
# }

output "instance_info" {
  value = {
    instance_ip         = vultr_instance.instance.main_ip
    username            = "linuxuser"
    password            = nonsensitive(vultr_instance.instance.default_password)
    login               = "ssh linuxuser@${vultr_instance.instance.main_ip} -i <PATH_TO_SSH_KEY>"
  }
}
