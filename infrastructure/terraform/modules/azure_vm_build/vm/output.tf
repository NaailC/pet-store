// Output the VM IPs and admin user

output "public_vm_ip" {
  value = module.virtual_machines.public.public_vm_ip
}

output "private_vm_ip" {
  value = module.virtual_machines.private.private_vm_ip
}

output "admin_username" {
  value = module.public.admin_username
}