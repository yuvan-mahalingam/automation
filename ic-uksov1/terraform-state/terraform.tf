terraform {
  backend "s3" {
    bucket         = "niceincontact-terraform-state-147997157422"
    key            = "inContact/routing-ng-infrastructure/eu-west-2/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "niceincontact-terraform-state-locks"
  }
}