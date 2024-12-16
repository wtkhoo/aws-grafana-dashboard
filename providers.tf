terraform {
  required_providers {
    aws = {
      source   = "hashicorp/aws"
      version  = "5.59.0"
    }
    grafana = {
      source   = "grafana/grafana"
      version  = "3.15.0"
    }
  }
}

provider "grafana" {
  url  = "https://${data.terraform_remote_state.aws_grafana_saml.outputs.grafana_workspace_url}"
  auth = data.terraform_remote_state.aws_grafana_saml.outputs.grafana_workspace_service_token
}