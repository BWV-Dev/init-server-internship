# Syntax Example
# output "info-server-2" {
#   value = module.['module-name'].info
# }

output "info-server-1" {
  value = module.intern-server-node-01.info
}

output "info-server-2" {
  value = module.intern-server-php-02.info
}
