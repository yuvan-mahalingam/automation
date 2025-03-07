terraform {
  backend "s3" {
    bucket         = "niceincontact-terraform-state-147997157422"
    key            = "inContact/routing-ng-infrastructure/new-region-2/terraform.tfstate"
    region         = "new-region-2"
    dynamodb_table = "niceincontact-terraform-state-locks"
  }
}