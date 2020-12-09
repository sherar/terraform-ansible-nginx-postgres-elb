# Terraform + Ansible + Nginx + Postgres
> Author: Gerardo Prieto

Provisions AWS infrastructure with Terraform and configures Web Servers (NGINX) + Postgres with Ansible

Stack:
● AWS infrastructure
    ○ Load Balancer
    ○ 3 Web Servers
        ■ Docker app:
            ● nginx
    ○ Postgres Server

Configure AWS environment and resources in an automated way.
The solution should produce a working environment containing publicly accessible load
balancer, with 3 web app servers as backends, and a database server.


## Prerequisites

### Option 1: Single account setup (Default)

If you want to implement this solution under a single AWS account, then:

 Make sure you got your AWS credentials configured already (https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)

### Option 2: Cross account envrionment Setup

In order to follow best practices, this repo was designed have the possibility to deploy the same resources on different environments (cross AWS account) and to store the Terraform state in a S3 bucket in a different account.

If you want to use this setup please update first `terraform_config.tf` file and remove comments from Option 1 (from lines 8-36) and then comment out Option 2 block (from lines 3-6)

_Notes:_
_- Terraform credentials should have enough privileges to assume these roles (Ideally running in a CI server)_
_- A S3 bucket `your-s3-bucket` should be created first (and permissions should be given)_
_- See https://www.terraform.io/docs/backends/types/s3.html_


## Usage

To run this example you need to execute:


```bash
$ export ENVIRONMENT=development
$ terraform init
$ terraform workspace select $ENVIRONMENT || terraform workspace new $ENVIRONMENT
$ terraform plan -var-file="$ENVIRONMENT.tfvars"
$ terraform apply
```

Note: Otherwise you can use `ENVIRONMENT=production` to pick up production environment configuration.


## Outputs

| Name | Description |
|------|-------------|
| load_balancer_fqdn | The auto-generated FQDN of the Application Load Balancer. |

## Tear down

```
$ terraform destroy
```

### Considerations:
- In order to scale up/down the Web Server, we can update `min_size`, `max_size, `desired_capacity` fron `.tfvars`
- Working with S3 Terraform Backend (with locking via DynamoDB) is always a good idea.
- Having Terraform running in a CI server so the environments get updated when code is pushed to the main branch.

### Next Steps:

- AWS ALB TLS support with ACM should be given in order to encrypt data in transit.
- Add Route53 record for the ALB
- Set rules for autoscaling in order to scale up/down automatically.
- AWS EC2 EBS volumes encryption at rest should be added.
- Manage user credentials for Postgres with AWS SSM Parameters, AWS Secrets Manager or Vault.
- Consider moving from AWS EC2 Postgres to AWS RDS Postgres solution (this will make things easier, like backups, maintenance, scaling, etc). Less admin overhead.