

###### RDS Module ######
module "rds-new-region-0" {
  source = "../../../modules/afm-terraform-rds"
  providers = {
    aws = aws.new-region-0
  }
  common-tags        = var.common-tags
  environment        = var.environment
  allowed-cidrs      = var.allowed-cidrs
  vpcId              = var.vpcId
  zones              = var.zones
  subnet-cidrs       = var.subnet-cidrs
  serverless-scaling = var.serverless-scaling
  git-cidr           = var.git-cidr
}

module "afm-heartbeat-sqs" {
  source      = "../../../modules/afm-heartbeat-sqs"
  common-tags = var.common-tags
}

module "secrets-manager-new-region-0" {
  source            = "../../../modules/ags-terraform-secret-manager"
  common-tags       = var.common-tags
  access-key-id     = var.access-key-id
  access-key-secret = var.access-key-secret
  environment       = var.environment
}

module "ssm-parameter-new-region-0" {
  source                                         = "../../../modules/ags-ssm-parameter"
  common-tags                                    = var.common-tags
  environment                                    = var.environment
  service-token-lambda-arn                       = var.service-token-provider-lambda-arn
  service-token-lambda-invoker-role-arn          = var.service-token-provider-lambda-invoker-role-arn
  kinesis-stream-tenant-events-consumer-role-arn = var.kinesis-stream-tenant-events-consumer-role-arn
}

module "afm-service-alarms" {
  source      = "../../../modules/ags-cloudwatch-alarm"
  common-tags = var.common-tags
  environment = var.environment
}

module "afm-terraform-dynamodb" {
  source      = "../../../modules/afm-terraform-dynamodb"
  common-tags = var.common-tags
  environment = var.environment
}
