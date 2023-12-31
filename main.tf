terraform {
  cloud {
    organization = "bwv-vinh-tt"
    workspaces {
      name = "intern-infra"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  required_version = ">= 0.14.9"
}

# DEFAULT - NO CHANGE
provider "aws" {
  region = var.default_aws_region
}

provider "aws" {
  region = "ap-northeast-1"
  alias  = "ap-northeast-1"
}

provider "aws" {
  region = "us-east-1"
  alias  = "us-east-1"
}

provider "aws" {
  region = "ap-southeast-1"
  alias  = "ap-southeast-1"
}
provider "random" {}
# END provider
