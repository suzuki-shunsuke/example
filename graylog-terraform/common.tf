resource "graylog_ldap_setting" "foo" {
  ldap_uri               = "ldap://ldap.example.com:389/"
  search_base            = "OU=user,OU=example,DC=example,DC=com"
  search_pattern         = "(cn={0})"
  display_name_attribute = "displayname"
  system_username        = "CN=admin"
  system_password        = "password"
  enabled                = true
  use_start_tls          = false
  trust_all_certificates = false
  active_directory       = false
}

resource "graylog_index_set" "default" {
  title                               = "Default index set"
  index_prefix                        = "graylog"
  rotation_strategy_class             = "org.graylog2.indexer.rotation.strategies.MessageCountRotationStrategy"
  retention_strategy_class            = "org.graylog2.indexer.retention.strategies.DeletionRetentionStrategy"
  description                         = "The Graylog default index set"
  index_analyzer                      = "standard"
  index_optimization_disabled         = true
  default                             = true
  writable                            = true
  shards                              = 4
  replicas                            = 0
  index_optimization_max_num_segments = 1

  retention_strategy = {
    max_number_of_indices = 20
    type                  = "org.graylog2.indexer.retention.strategies.DeletionRetentionStrategyConfig"
  }

  rotation_strategy = {
    max_docs_per_index = 20000000
    max_size           = 0
    type               = "org.graylog2.indexer.rotation.strategies.MessageCountRotationStrategyConfig"
  }
}
