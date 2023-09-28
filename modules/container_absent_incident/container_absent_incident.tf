resource "shoreline_notebook" "container_absent_incident" {
  name       = "container_absent_incident"
  data       = file("${path.module}/data/container_absent_incident.json")
  depends_on = [shoreline_action.invoke_restart_container]
}

resource "shoreline_file" "restart_container" {
  name             = "restart_container"
  input_file       = "${path.module}/data/restart_container.sh"
  md5              = filemd5("${path.module}/data/restart_container.sh")
  description      = "Restart the containers: Try to restart the absent containers using the system's management tools or command-line interface. This can help bring them back online and restore their normal functioning."
  destination_path = "/agent/scripts/restart_container.sh"
  resource_query   = "host"
  enabled          = true
}

resource "shoreline_action" "invoke_restart_container" {
  name        = "invoke_restart_container"
  description = "Restart the containers: Try to restart the absent containers using the system's management tools or command-line interface. This can help bring them back online and restore their normal functioning."
  command     = "`chmod +x /agent/scripts/restart_container.sh && /agent/scripts/restart_container.sh`"
  params      = ["CONTAINER_NAME"]
  file_deps   = ["restart_container"]
  enabled     = true
  depends_on  = [shoreline_file.restart_container]
}

