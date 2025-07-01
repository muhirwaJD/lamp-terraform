output "web_public_ip" {
  value = module.web.web_public_ip
}

output "web_instance_id" {
  value = module.web.web_instance_id
}

output "app_instance_id" {
  value = module.app.app_instance_id
}

output "db_instance_id" {
  value = module.db.db_instance_id
}

