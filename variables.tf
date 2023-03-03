
variable "aws_users" {
  default = ["Jarrett", "Mireille", "Ali", "Yicao"]
}

variable "s3-bucket-name" {
  default = "project-1-bucket-0000"
}

variable "bucket-count" {
  default = 2
}

variable "azure_storage_name" {
    default = "project1-storage"
}

variable "azure_vm_name" {
    default = "project-1-vm"
}