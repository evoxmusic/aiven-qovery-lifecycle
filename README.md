# Create and Destroy an Aiven PostgreSQL Instance with Qovery

This example shows how to create and destroy an Aiven PostgreSQL instance with Terraform and Qovery [Lifecycle Job](https://hub.qovery.com/docs/using-qovery/configuration/lifecycle-job/).

## How to test it

First, you need to set the following environment variables:
- `TF_VAR_terraform_backend_bucket`: your name of the S3 bucket used to store the Terraform state (you must create the bucket)
- `TF_VAR_aws_access_key_id`: your AWS access key ID
- `TF_VAR_aws_secret_access_key`: your AWS secret access key
- `TF_VAR_aws_region`: your AWS region
- `TF_VAR_qovery_environment_id`: your Qovery environment ID (you can put a random alphanumeric value for local testing)
- `TF_VAR_aiven_project_name`: your Aiven project name

Then, you can run the following commands:

```shell
docker build \
  --build-arg TF_VAR_terraform_backend_bucket=<YOUR_S3_TERRAFORM_BACKEND_BUCKET_NAME> \
  --build-arg TF_VAR_aws_access_key_id=<YOUR_AWS_ACCESS_KEY_ID> \ 
  --build-arg TF_VAR_aws_secret_access_key=<YOUR_AWS_SECRET_ACCESS_KEY> \
  --build-arg TF_VAR_aws_region=us-east-2 \
  \ -t pg-aiven .
```

### To deploy your RDS instance

```shell
docker run \
  -e TF_VAR_aws_access_key_id=<YOUR_ACCESS_KEY_ID> \
  -e TF_VAR_aws_secret_access_key=<YOUR_SECRET_ACCESS_KEY> \
  -e TF_VAR_aws_region=us-east-2 \
  -it --entrypoint /bin/sh pg-aiven \
  -c "terraform plan && terraform apply -auto-approve && terraform output -json"
```

### To destroy your RDS instance

```shell
docker run \
  -e TF_VAR_aws_access_key_id=<YOUR_ACCESS_KEY_ID> \
  -e TF_VAR_aws_secret_access_key=<YOUR_SECRET_ACCESS_KEY> \
  -e TF_VAR_aws_region=us-east-2 \
  -it --entrypoint /bin/sh pg-aiven \
  -c "terraform plan && terraform destroy -auto-approve"
```

## How to use it on Qovery

1. Fork this project
2. [Create a new Lifecycle Job](https://hub.qovery.com/docs/using-qovery/configuration/lifecycle-job/)
3. Set the following working root path: `/` (default)
4. Set the following environment variables:
  - `TF_VAR_terraform_backend_bucket`: your name of the S3 bucket used to store the Terraform state (you must create the bucket)
  - `TF_VAR_aws_access_key_id`: your AWS S3 access key ID
  - `TF_VAR_aws_secret_access_key`: your AWS S3 secret access key
  - `TF_VAR_aws_region`: your AWS S3 region
  - `TF_VAR_qovery_environment_id`: your Qovery environment ID (you can put a random alphanumeric value for local testing)
  - `TF_VAR_aiven_project_name`: your Aiven project name
5. Set the following command:
  - To deploy your Aiven PostgreSQL instance: `["-c", "terraform plan && terraform apply -auto-approve && terraform output -json > /qovery-output/qovery-output.json"]`
  - To destroy your Aiven PostgreSQL instance: `["-c", "terraform plan && terraform destroy -auto-approve"]`
