# Retrieve output values from another Terraform state
data "terraform_remote_state" "aws_grafana_saml" {
  backend = "local"

  config = {
    path = "${path.module}/../aws-grafana-saml/terraform.tfstate"
  }
}