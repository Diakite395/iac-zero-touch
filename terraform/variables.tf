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

# variable "admin_cidr" {
#   description = "Ton IP publique en /32 pour le SSH"
#   type        = string
# }

variable "ssh_public_key_path" {
  description = "Chemin de la clé publique SSH"
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
}

variable "repo_url" {
  description = "URL HTTPS du dépôt Git"
  type        = string
  default     = "https://github.com/Diakite395/iac-zero-touch.git"
}

variable "admin_cidr" {
  description = "Ton IP publique en /32 pour le SSH"
  type        = string
  sensitive   = true
}

variable "ssh_public_key" {
  description = "Contenu de la clé publique SSH"
  type        = string
}