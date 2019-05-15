# module21

Quick start

Please note that this example will deploy real resources into your AWS account. We have made every effort to ensure all the resources qualify for the AWS Free Tier, but we are not responsible for any charges you may incur.

Configure your AWS access keys as environment variables in module2 directory:

```
export AWS_ACCESS_KEY_ID=(your access key id)
export AWS_SECRET_ACCESS_KEY=(your secret access key
```

Configure your database password as environment variable in module2/server directory:

```
variable "db_password" {
  description = "password"
  default     = "<your db password>"
}

```
