
# # START HERE
module "intern-server-node-01" {
  source = "./intern-server"
  providers = {
    aws = aws.ap-northeast-1 # aws."key" = aws."region" [ap-northeast-1, us-east-1, ap-southeast-1] 
  }
  # CONST VARS
  ec2_instance_type = var.ec2_instance_type
  cidr_blocks       = var.cidr_blocks
  cron_start        = var.cron_start
  cron_stop         = var.cron_stop

  # DYNAMIC VARS
  ami_id            = "ami-04beabd6a4fb6ab6f" # Linux 2023
  aws_profile       = "bwv-vinh-tt"
  key_pair_name     = "vinh-tt-personal"
  tag_name_instance = "intern-exam-nodejs"
  mysql_user_name   = "admin"
  mysql_password    = "Bwv@2023"
  mysql_db_schema   = "db_intern"
  git_url           = "github.com/BWV-Dev/intern-nodejs-source.git"
  github_token      = "###"
  environment       = "node"
}

module "intern-server-php-02" {
  source = "./intern-server"
  providers = { # aws."key" = aws."region" [ap-northeast-1, us-east-1, ap-southeast-1] 
    aws = aws.ap-northeast-1
  }
  # CONST VARS
  ec2_instance_type = var.ec2_instance_type
  cidr_blocks       = var.cidr_blocks
  cron_start        = var.cron_start
  cron_stop         = var.cron_stop

  # DYNAMIC VARS
  ami_id            = "ami-04beabd6a4fb6ab6f"
  aws_profile       = "bwv-vinh-tt"
  key_pair_name     = "vinh-tt-personal"
  tag_name_instance = "intern-exam-php"
  mysql_user_name   = "admin"
  mysql_password    = "Bwv@2023"
  mysql_db_schema   = "db_intern"
  git_url           = "github.com/bwv-vinh-tt/php-demo-docker.git"
  github_token      = "###"
  environment       = "php"
}