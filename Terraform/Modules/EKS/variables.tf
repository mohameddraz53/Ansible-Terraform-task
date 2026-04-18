variable "actions" {
  type    = list(string)
  default = ["sts:AssumeRole", "sts:TagSession"]
}
variable "policy" {
  type    = string
  default = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}
variable "kubernetes" {
  type    = list(string)
  default = ["group-1", "group-2"]
}
variable "service" {
  type    = string
  default = "eks.amazonaws.com"
}
