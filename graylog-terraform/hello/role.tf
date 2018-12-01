resource "graylog_role" "regular_employee" {
  name = "${local.name}-regular_employee"
  description = "${local.name} regular employee"
  permissions = [
    "indexsets:read:${graylog_index_set.hello-dev.id}",
    "streams:read:${graylog_stream.hello-dev.id}",
  ]
}
