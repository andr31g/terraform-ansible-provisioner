data "aws_availability_zones" "this" {
    state = "available"
    filter {
        name = "region-name"
        values = [var.aws_region]
    }
}
