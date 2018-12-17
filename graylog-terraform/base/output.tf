output "reader" {
  value = "${graylog_role.reader.name}"
}

output "editor" {
  value = "${graylog_role.editor.name}"
}

output "admin" {
  value = "${graylog_role.admin.name}"
}

output "stream_id" {
  value = "${graylog_stream.main.id}"
}
