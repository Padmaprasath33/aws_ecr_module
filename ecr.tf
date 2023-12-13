resource "aws_ecr_repository" "cohort_demo_ui" {
  name                 = "2191420-cohort-demo-ui"
  image_tag_mutability = "IMMUTABLE"

  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "KMS"
  }
  tags = var.resource_tags_dr
}

resource "aws_ecr_lifecycle_policy" "cohort_demo_ui_policy" {
  repository = aws_ecr_repository.cohort_demo_ui.name

  policy = file("${path.module}/ecr_lifecycle_policy.json")
}

resource "aws_ecr_repository" "cohort_demo_backend" {
  name                 = "2191420-cohort-demo-backend"
  image_tag_mutability = "IMMUTABLE"

  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "KMS"
  }
  tags = var.resource_tags_dr
}

resource "aws_ecr_lifecycle_policy" "cohort_demo_backend_policy" {
  repository = aws_ecr_repository.cohort_demo_backend.name

  policy = file("${path.module}/ecr_lifecycle_policy.json")
}

data "aws_caller_identity" "current" {}

resource "aws_ecr_replication_configuration" "cohort_demo_crr" {
  replication_configuration {
    rule {
      destination {
        region      = var.cohort_demo_ecr_crr_region
        registry_id = data.aws_caller_identity.current.account_id
      }
      repository_filter {
        filter      = "2191420-cohort-demo"
        filter_type = "PREFIX_MATCH"
      }
    }
  }
}