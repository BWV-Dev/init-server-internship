locals {
  mysql  = file("${path.module}/script/mysql.sh")
  env   = file("${path.module}/script/env.sh")
  source = file("${path.module}/script/source.sh")
}

data "template_file" "mysql" {
  template = local.mysql
  vars = {
    user_name = "${var.mysql_user_name}"
    password  = "${var.mysql_password}"
    db_schema = "${var.mysql_db_schema}"
  }
}

data "template_file" "env" {
  template = local.env
  vars = {
    env = "${var.environment}"
  }
}

data "template_file" "source" {
  template = local.source
  vars = {
    github_token = "${var.github_token}"
    git_url      = "${var.git_url}"
    env = "${var.environment}"
    user_name = "${var.mysql_user_name}"
    password  = "${var.mysql_password}"
    db_schema = "${var.mysql_db_schema}"
  }
}

data "template_cloudinit_config" "master" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.mysql.rendered
  }

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.env.rendered
  }

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.source.rendered
  }
}

data "aws_ssm_document" "start_instance_document" {
  name = "AWS-StartEC2Instance"
}

data "aws_ssm_document" "stop_instance_document" {
  name = "AWS-StopEC2Instance"
}