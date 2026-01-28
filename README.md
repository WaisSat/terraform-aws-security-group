# AWS Security Group Terraform Module

## 👤 Author Information
- **Developer:** Wais Satari
- **Role:** Cloud & DevOps Engineer
- **Project:** Terraform Module Publishing Capstone

> **Note:** This module demonstrates Infrastructure as Code (IaC) best practices, including input validation, dynamic blocks, and native Terraform testing.

---

## 🛠 Usage
```hcl
module "security_group" {
  source  = "WaisSat/security-group/aws"
  version = "1.0.0"

  name   = "web-server-sg"
  vpc_id = "vpc-xxxxxxxx"
  
  ingress_rules = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "HTTP"
    }
  ]
}
```


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.28.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | List of maps for ingress rules: {port, protocol, cidr\_blocks, description} | <pre>list(object({<br/>    from_port   = number<br/>    to_port     = number<br/>    protocol    = string<br/>    cidr_blocks = list(string)<br/>    description = string<br/>  }))</pre> | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the security group | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags for the resource | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID where the security group will be created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_module_author"></a> [module\_author](#output\_module\_author) | The engineer who developed this module |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | The ID of the security group |
<!-- END_TF_DOCS -->