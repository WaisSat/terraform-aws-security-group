# Standard provider for testing
provider "aws" {
  region = "us-east-1"
}

variables {
  name   = "recruiter-demo-sg"
  vpc_id = "vpc-12345678"
  ingress_rules = [
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow HTTPS"
    }
  ]
}

run "verify_sg_config" {
  command = plan

  assert {
    condition     = aws_security_group.this.name == "recruiter-demo-sg"
    error_message = "Security group name does not match the input variable."
  }

  assert {
    condition     = aws_security_group.this.tags["DevelopedBy"] == "Wais Satari"
    error_message = "The 'DevelopedBy' tag is missing or incorrect."
  }
}
