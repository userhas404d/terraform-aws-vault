###
### REQUIRED VARIABLES
###
variable "name" {
  type        = string
  description = "Name of the vault stack, will be use to prefix resources"
}

variable "environment" {
  type        = string
  description = "Type of environment -- must be one of: dev, test, prod"
}

variable "key_pair_name" {
  type        = string
  description = "Keypair to associate to launched instances"
}

variable "ami_owner" {
  type        = string
  description = "Account id/alias of the AMI owner"
}

variable "additional_ips_allow_inbound" {
  type        = list(string)
  description = "List of ip address that allow to have access to resources"
  default     = []
}

variable "ec2_extra_security_group_ids" {
  type        = list(string)
  description = "List of additional security groups to add to EC2 instances"
  default     = []
}

variable "ec2_subnet_ids" {
  type        = list(string)
  description = "List of subnets where EC2 instances will be launched"
}

variable "lb_subnet_ids" {
  type        = list(string)
  description = "List of subnets to associate to the Load Balancer"
}

variable "vault_version" {
  type        = string
  description = "Version of Vault to be installed on servers"
}

variable "vault_url" {
  type        = string
  description = "The DNS address that vault will be accessible at. Stack name will be used as the url when value is set to empty. Example: vault.domain.net"
  default     = ""
}

variable "domain_name" {
  type        = string
  description = "The domain name where vault url will be registered to. Example: domain.net"
}

variable "route53_zone_id" {
  type        = string
  description = "Hosted zone ID Route 53 hosted zone"
}

variable "kms_key_id" {
  type        = string
  description = "Id of an AWS KMS key use for auto unseal operation when vault is intialize"
  default     = ""
}

variable "dynamodb_table" {
  type        = string
  description = "Name of the Dynamodb to be used as storage backend for Vault"
  default     = ""
}

###
### OPTIONAL VARIABLES
###
variable "ami_name_filter" {
  type        = string
  description = "Will be use to filter out AMI"
  default     = "spel-minimal-centos-7-hvm-*.x86_64-gp2"
}

variable "ami_name_regex" {
  type        = string
  description = "Regex to help fine-grain filtering AMI"
  default     = "spel-minimal-centos-7-hvm-\\d{4}\\.\\d{2}\\.\\d{1}\\.x86_64-gp2"
}

variable "configs_path" {
  type        = string
  description = "Path to directory that contains configuration files for vault"
  default     = ""
}

variable "enable_access_logs" {
  type        = bool
  description = "Boolean indicating whether to enable access logs for load balancer"
  default     = false
}

variable "instance_type" {
  type        = string
  description = "Amazon EC2 instance type"
  default     = "t2.medium"
}

variable "lb_internal" {
  type        = bool
  description = "Boolean indicating whether the load balancer is internal or external"
  default     = false
}

variable "ingress_cidr_blocks" {
  type        = list(string)
  description = "(Optional) List of CIDR block."
  default     = ["0.0.0.0/0"]
}

variable "lb_ssl_policy" {
  type        = string
  description = "The name of the SSL Policy for the listener"
  default     = "ELBSecurityPolicy-FS-2018-06"
}

variable "min_capacity" {
  type        = string
  description = "(Optional) Minimum number of instances in the Autoscaling Group"
  default     = "1"
}

variable "max_capacity" {
  type        = string
  description = "(Optional) Maximum number of instances in the Autoscaling Group"
  default     = "2"
}

variable "desired_capacity" {
  type        = string
  description = "(Optional) Desired number of instances in the Autoscaling Group"
  default     = "2"
}

variable "pypi_index_url" {
  type        = string
  description = "(Optional) URL to the PyPi Index"
  default     = "https://pypi.org/simple"
}

variable "cfn_endpoint_url" {
  type        = string
  description = "(Optional) URL to the CloudFormation Endpoint. e.g. https://cloudformation.us-east-1.amazonaws.com"
  default     = "https://cloudformation.us-east-1.amazonaws.com"
}

variable "cfn_bootstrap_utils_url" {
  type        = string
  description = "(Optional) URL to aws-cfn-bootstrap-latest.tar.gz"
  default     = "https://s3.amazonaws.com/cloudformation-examples/aws-cfn-bootstrap-latest.tar.gz"
}

variable "cloudwatch_agent_url" {
  type        = string
  description = "(Optional) S3 URL to CloudWatch Agent installer. Example: s3://amazoncloudwatch-agent/linux/amd64/latest/AmazonCloudWatchAgent.zip"
  default     = ""
}

variable "watchmaker_config" {
  type        = string
  description = "(Optional) URL to a Watchmaker config file"
  default     = ""
}

variable "watchmaker_ou_path" {
  type        = string
  description = "(Optional) DN of the OU to place the instance when joining a domain. If blank and WatchmakerEnvironment enforces a domain join, the instance will be placed in a default container. Leave blank if not joining a domain, or if WatchmakerEnvironment is false"
  default     = ""
}

variable "watchmaker_admin_groups" {
  type        = string
  description = "(Optional) Colon-separated list of domain groups that should have admin permissions on the EC2 instance"
  default     = ""
}

variable "watchmaker_admin_users" {
  type        = string
  description = "(Optional) Colon-separated list of domain users that should have admin permissions on the EC2 instance"
  default     = ""
}

variable "toggle_update" {
  type        = string
  default     = "A"
  description = "(Optional) Toggle that triggers a stack update by modifying the launch config, resulting in new instances; must be one of: A or B"
}

variable "tags" {
  type        = map(string)
  description = "(Optional) list of tags to include with resource"
  default     = {}
}
