resource "aws_backup_vault" "prod_vault" {
  name = "${var.name_prefix}-prod-backup-vault"
  tags = merge(var.tags, { Name = "${var.name_prefix}-prod-backup-vault" })
}

resource "aws_backup_plan" "prod_backup_plan" {
  name = "${var.name_prefix}-prod-backup-plan"

  rule {
    rule_name         = "daily-backup"
    target_vault_name = aws_backup_vault.prod_vault.name
    schedule          = var.backup_schedule
    lifecycle {
      delete_after = var.backup_retention_days
    }
    recovery_point_tags = {
      Environment = "prod"
    }
  }
}

resource "aws_backup_selection" "prod_selection" {
  name         = "${var.name_prefix}-prod-backup-selection"
  plan_id      = aws_backup_plan.prod_backup_plan.id
  iam_role_arn = var.backup_role_arn

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "Environment"
    value = "prod"
  }
}
