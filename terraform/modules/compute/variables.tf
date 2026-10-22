variable "project_name" {
  type = string
}

variable "subnet_ids" {
  description = "Un sous-réseau par instance"
  type        = list(string)
}

variable "security_group_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "instance_count" {
  type    = number
  default = 2
}

variable "public_key" {
  description = "Contenu de la clé publique SSH"
  type        = string
}