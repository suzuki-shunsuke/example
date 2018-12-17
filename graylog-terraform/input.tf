resource "graylog_input" "gelf_udp" {
  title = "gelf udp"
  type  = "org.graylog2.inputs.gelf.udp.GELFUDPInput"
  node  = "<node id>"

  attributes = {
    bind_address          = "0.0.0.0"
    port                  = 12201
    recv_buffer_size      = 262144
    decompress_size_limit = 8388608
  }
}
