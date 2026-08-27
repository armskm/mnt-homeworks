output "all_vm" {

  value = [
    { master = [yandex_compute_instance.vm_master[*].network_interface[0].nat_ip_address, yandex_compute_instance.vm_master[*].network_interface[0].ip_address, yandex_compute_instance.vm_master[*].fqdn] },
    { node = [yandex_compute_instance.vm_node[*].network_interface[0].nat_ip_address, yandex_compute_instance.vm_node[*].network_interface[0].ip_address, yandex_compute_instance.vm_node[*].fqdn] }
  ]
}
