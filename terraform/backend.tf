terraform {
  required_version = ">= 1.10.0"

  backend "s3" {
    bucket       = "iac-zero-touch-tfstate-XXXX"
    key          = "zero-touch/terraform.tfstate"
    region       = "eu-west-3"
    encrypt      = true
    use_lockfile = true
  }
}