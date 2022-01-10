#terraform {
#  backend "s3" {
#    bucket = "terraform-devops-bkt"
#    key = "terfrm-state/terraform.tfstate"
#    region = "us-east-2"
#    access_key = "AKIAWYXC4LS6VTN7T67B"
#    secret_key = "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" 
#    dynamodb_table = "tf_state_lock"
#  }
#}