module "hello-prod" {
  source    = "./hello"
  stream_id = "${module.hello-prod-base.stream_id}"
  env       = "prod"
}

module "hello-prod-base" {
  source = "./base"
  name   = "hello-prod"
}
