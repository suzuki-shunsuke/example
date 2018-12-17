provider "graylog" {
  web_endpoint_uri = "${var.web_endpoint_uri}"
  auth_name        = "${var.auth_name}"
  auth_password    = "${var.auth_password}"
}
