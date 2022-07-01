output "extensions" {
  value = local.file_extensions
}

output "instance_arns" {
  value = [for k, v in aws_instance.this : v.arn]
}

output "instance_names" {
  value = { for k, v in aws_instance.this : k => v.tags.name }
}

output "private_ips" {
  value = [for ip in local.ips : ip.private]
}

output "public_ips" {
  value = local.ips[*].public
}
