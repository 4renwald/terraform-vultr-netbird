output "netbird_instance_info" {
    value = module.netbird_instance.instance_info
}
output "netbird_credentials" {
    description = "NetBird admin credentials location."
    value = "The NetBird admin credentials will be found inside the /home/linuxuser/netbird/setup.log file once the installation is completed."
}