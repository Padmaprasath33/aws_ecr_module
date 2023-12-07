variable "cohort_demo_ecr_crr_region" {
  description = "ECR cross region replication region"
  //default     = ""
}

variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  /*default     = {
    project     = "aws-proserv",
    environment = "dev"
    application = "cohort-demo"
  }
  */
}

variable "resource_tags_dr" {
  description = "Tags to set for all resources"
  type        = map(string)
  /*default     = {
    project     = "aws-proserv",
    environment = "dev"
    application = "cohort-demo"
    backup      = "yes"
  }
  */
}
