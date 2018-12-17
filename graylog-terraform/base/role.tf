resource "graylog_role" "reader" {
  name        = "${var.name}-reader"
  description = "${var.name} reader"

  permissions = [
    "indexsets:read:${graylog_index_set.main.id}",
    "streams:read:${graylog_stream.main.id}",
  ]
}

resource "graylog_role" "editor" {
  name        = "${var.name}-editor"
  description = "${var.name} editor"

  permissions = [
    "indexsets:read:${graylog_index_set.main.id}",
    "streams:read:${graylog_stream.main.id}",
    "indexsets:edit:${graylog_index_set.main.id}",
    "streams:edit:${graylog_stream.main.id}",
  ]
}

resource "graylog_role" "admin" {
  name        = "${var.name}-admin"
  description = "${var.name} admin"

  permissions = [
    "indexsets:read:${graylog_index_set.main.id}",
    "streams:read:${graylog_stream.main.id}",
    "indexsets:edit:${graylog_index_set.main.id}",
    "streams:edit:${graylog_stream.main.id}",
    "indexsets:delete:${graylog_index_set.main.id}",
    "streams:changestate:${graylog_stream.main.id}",
  ]
}
