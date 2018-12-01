resource "graylog_index_set" "hello-dev" {
  description = "${local.name}-dev"
  index_analyzer = "standard"
  index_optimization_disabled = false
  index_optimization_max_num_segments = 1
  index_prefix = "${local.name}-dev"
  shards = 4
  rotation_strategy_class = "org.graylog2.indexer.rotation.strategies.MessageCountRotationStrategy"
  retention_strategy_class = "org.graylog2.indexer.retention.strategies.DeletionRetentionStrategy"
  retention_strategy = {
    max_number_of_indices = 1
    type = "org.graylog2.indexer.retention.strategies.DeletionRetentionStrategyConfig"
  }
  rotation_strategy = {
    max_docs_per_index = 20000000
    max_size = 0
    type = "org.graylog2.indexer.rotation.strategies.MessageCountRotationStrategyConfig"
  }
  title = "${local.name}-dev"
  writable = true
}
