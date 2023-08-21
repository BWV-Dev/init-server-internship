output "instance_id" {
  value = aws_instance.intern_exam_instance.id
}

output "ec2_public_ip" {
  value = aws_eip.eip_ec2.public_ip
}

output "ec2_name" {
  value = aws_instance.intern_exam_instance.tags.Name
}

output "mysql_user_name" {
  value = var.mysql_user_name
}

output "mysql_password" {
  value = var.mysql_password
}

output "mysql_db_schema" {
  value = var.mysql_db_schema
}

output "region" {
  value = aws_instance.intern_exam_instance.availability_zone
}

output "info" {
  value = {
    EC2_ID = aws_instance.intern_exam_instance.id
    EC2_IP = aws_eip.eip_ec2.public_ip
    EC2_NAME = aws_instance.intern_exam_instance.tags.Name
    MYSQL_USER_NAME = var.mysql_user_name
    MYSQL_PASSWORD = var.mysql_password
    MYSQL_DATABASE_SHEMA = var.mysql_db_schema
    REGION = aws_instance.intern_exam_instance.availability_zone
  }
}