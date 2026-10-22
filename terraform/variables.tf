variable "aws_region" {
  description = "Region AWS"
  type        = string
  default     = "eu-west-3"
}

variable "project_name" {
  description = "Nom du projet (prefixe des ressources)"
  type        = string
  default     = "zero-touch"
}

variable "vpc_cidr" {
  description = "CIDR du VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR des sous-reseaux publics"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}