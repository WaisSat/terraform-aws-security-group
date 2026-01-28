variable "name" {
  description = "Name of the security group"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the security group will be created"
  type        = string
  validation {
    condition     = can(regex("^vpc-", var.vpc_id))
    error_message = "The vpc_id must begin with 'vpc-'."
  }
}

variable "ingress_rules" {
  description = "List of maps for ingress rules: {port, protocol, cidr_blocks, description}"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
  default = []
}

variable "tags" {
  description = "Additional tags for the resource"
  type        = map(string)
  default     = {}
}
