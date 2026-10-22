variable "project_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "admin_cidr" {
  description = "IP autorisée en SSH, au format x.x.x.x/32"
  type        = string
}