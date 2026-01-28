locals {
  author = "Wais Satari"
  bio    = "Cloud & DevOps Engineer | Terraform Specialist"

  standard_tags = {
    DevelopedBy = local.author
    Project     = "Terraform-Capstone-2026"
    ManagedBy   = "Terraform"
  }
}

resource "aws_security_group" "this" {
  name        = var.name
  description = "Security group created by ${local.author} - ${local.bio}"
  vpc_id      = var.vpc_id

  # Dynamic blocks show advanced module design patterns
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.standard_tags, var.tags)
}
