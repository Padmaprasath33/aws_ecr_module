output "cohort_demo_ui_ecr_repo_url" {
  value = aws_ecr_repository.cohort_demo_ui.repository_url
}

output "cohort_demo_backend_ecr_repo_url" {
  value = aws_ecr_repository.cohort_demo_backend.repository_url
}