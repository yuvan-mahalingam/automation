terraform {
  backend "s3" {
    bucket         = "niceincontact-terraform-state-147997157422"
    key            = "inContact/routing-ng-infrastructure/new-region-8/terraform.tfstate"
    region         = "new-region-8"
    dynamodb_table = "niceincontact-terraform-state-locks"
  }
}