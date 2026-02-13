variable "project_name" {}
variable "cluster_id" {}
variable "execution_role_arn" {}
variable "subnets" {
  type = list(string)
}
variable "tags" {
  type = map(string)
}
