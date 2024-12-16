# Deploy Grafana dashboard with Terraform

## Overview

This folder contains a simple project for deploying a sample Grafana dashboard with CloudWatch metrics as data source. This is one part of the solutions for my [blog post](https://blog.wkhoo.com/posts/aws-grafana-with-saml/) to demonstrate SAML attribute group integration in Grafana.

> **Note:** This Terraform code is referencing a Terraform stack from another [project](https://github.com/wtkhoo/aws-grafana-saml).

The Grafana dashboard configuration file is from [Monitoring Artist](https://github.com/monitoringartist/grafana-aws-cloudwatch-dashboards).

## Requirements

- [Terraform](https://www.terraform.io/downloads) (>= 1.5.0)
- AWS account [configured with proper credentials to run Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication-and-configuration)
- EC2 workload in the AWS account to generate some CloudWatch metrics

## Walkthrough

1) Clone this repository to your local machine.

   ```shell
   git clone https://github.com/wtkhoo/aws-grafana-dashboard.git
   ```

2) Change your directory to the `aws-grafana-dashboard` folder.

   ```shell
   cd aws-grafana-dashboard
   ```

3) Run the terraform [init](https://www.terraform.io/cli/commands/init) command to initialize the Terraform deployment and set up the providers.

   ```shell
   terraform init
   ```
  
4) Next step is to run a terraform [plan](https://www.terraform.io/cli/commands/plan) command to preview what will be created.

   ```shell
   terraform plan
   ```

5) If your values are valid, you're ready to go. Run the terraform [apply](https://www.terraform.io/cli/commands/apply) command to provision the resources.

   ```shell
   terraform apply
   ```

6) When you're done with the demo, run the terraform [destroy](https://www.terraform.io/cli/commands/destroy) command to delete all resources that were created in your AWS environment.

   ```shell
   terraform destroy
   ```

## Questions and Feedback

If you have any questions or feedback, please don't hesitate to [create an issue](https://github.com/wtkhoo/aws-grafana-dashboard/issues/new).