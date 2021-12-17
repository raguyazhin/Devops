variable "sg_ports" {
    type = list(number)
    description = "list of ports for ingress and egress"
    default = ["9001","8080","8090","8082"]
}
