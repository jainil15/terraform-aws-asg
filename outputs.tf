output "asg_arn" {
  value = aws_autoscaling_group.this.arn
}

output "asg_id" {
  value = aws_autoscaling_group.this.id
}
