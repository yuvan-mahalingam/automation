terraform {
  backend "s3" {
    bucket         = "niceincontact-terraform-state-147997157422"
    key            = "inContact/routing-ng-infrastructure/new-region-5/terraform.tfstate"
    region         = "new-region-5"
    dynamodb_table = "niceincontact-terraform-state-locks"
  }
}