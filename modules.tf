
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
  key_pair_name     = "vinh-tt-personal"
  tag_name_instance = "intern-exam-nodejs-01"
  mysql_user_name   = "admin"
  mysql_password    = "Bwv@2023"
  mysql_db_schema   = "db_intern"
  git_url           = "github.com/BWV-Dev/##"
  github_token      = "###"
  environment       = "node"
}

module "intern-server-php-02" {
  source = "./intern-server"
  providers = { # aws."key" = aws."region" [ap-northeast-1, us-east-1, ap-southeast-1] 
    aws = aws.us-east-1
  }
  # CONST VARS
  ec2_instance_type = var.ec2_instance_type
  cidr_blocks       = var.cidr_blocks
  cron_start        = var.cron_start
  cron_stop         = var.cron_stop

  # DYNAMIC VARS
  ami_id            = "ami-08a52ddb321b32a8c"
  key_pair_name     = "vinh-tt-personal-east"
  tag_name_instance = "intern-exam-php"
  mysql_user_name   = "admin"
  mysql_password    = "Bwv@2023"
  mysql_db_schema   = "db_intern"
  git_url           = "github.com/b####"
  github_token      = "####"
  environment       = "php"
}