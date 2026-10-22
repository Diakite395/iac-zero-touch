provider "aws" {
  region = var.aws_region

  default_tags {
    # tags = {
    #   Project   = var.project_name
    #   ManagedBy = "terraform"
    # }

    tags = {
      Project     = var.project_name
      ManagedBy   = "terraform"
      Environment = "demo"
    }
  }
}