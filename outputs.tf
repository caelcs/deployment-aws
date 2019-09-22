output "MASTER" {
  value = module.master.ip
}

output "WORKERS" {
  value = module.worker.ips
}
