# Create a simple dashboard to view CloudWatch Logs metrics
resource "grafana_dashboard" "ec2" {
  config_json = file("./aws-ec2.json")
  folder      = grafana_folder.demo.id
  overwrite   = true
}

# Define a Grafana data source
resource "grafana_data_source" "cloudwatch" {
  type = "cloudwatch"
  name = "cloudwatch"
  json_data_encoded = jsonencode({
    default_region = "ap-southeast-2"
  })
}

# Create a Grafana folder
resource "grafana_folder" "demo" {
  title = "demo"
}

# Set up Grafana folder permissions
resource "grafana_folder_permission" "demo" {
  folder_uid = grafana_folder.demo.uid
  permissions {
    team_id    = grafana_team.admin.id
    permission = "Admin"
  }
  permissions {
    team_id    = grafana_team.editor.id
    permission = "Edit"
  }
  permissions {
    team_id    = grafana_team.viewer.id
    permission = "View"
  }
}

# Create Grafana Teams and map external group sync
resource "grafana_team" "admin" {
  name  = "Grafana_Admins"
  team_sync {
    groups = ["Grafana_Admins"]
  }
}

resource "grafana_team" "editor" {
  name  = "Grafana_Editors"
  team_sync {
    groups = ["Grafana_Editors"]
  }
}

resource "grafana_team" "viewer" {
  name  = "Grafana_Viewers"
  team_sync {
    groups = ["Grafana_Viewers"]
  }
}
