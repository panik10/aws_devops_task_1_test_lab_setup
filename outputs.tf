output "vpc_id" {
    description = "ID of the VPC, deployed by the module"
    value       = aws_vpc.network.id
}
