terraform {
  backend "s3" {
    bucket         = "niceincontact-terraform-state-147997157422"
    key            = "inContact/routing-ng-infrastructure/eu-west-2/terraform.tfstate" new-region-5
    region         = "eu-west-2" new-region-5
    dynamodb_table = "niceincontact-terraform-state-locks"
  }
}
